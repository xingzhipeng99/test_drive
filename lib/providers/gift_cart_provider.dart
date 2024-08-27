import 'package:flutter/material.dart';

class GiftCartItem {
  final int id;
  final String title;
  final int quantity;
  final double price;

  GiftCartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class CartProvider with ChangeNotifier {
  final Map<int, GiftCartItem> _items = {};

  Map<int, GiftCartItem> get items {
    return {..._items};
  }

  void addItem(int productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => GiftCartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => GiftCartItem(
          // id: DateTime.now().toString() as int,
          id: _items.length + 1,
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }
}

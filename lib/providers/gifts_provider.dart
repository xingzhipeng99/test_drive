import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class GiftsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      1,
      'Red Shirt',
      'A red shirt - it is pretty red',
      'Shirt',
      29.99,
      4,
      ['Shirt'],
      'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
    ),
    Product(
      2,
      'Blue Jeans',
      'A nice pair of blue jeans',
      'Jeans',
      59.99,
      4.5,
      ['Jeans'],
      'https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png',
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(int id) {
    return _items.firstWhere((x) => x.id == id);
  }
}

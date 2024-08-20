import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/screens/product_overview_screen.dart';
import 'package:test_drive/widgets/cart_badge.dart';
import 'package:test_drive/providers/cart_provider.dart';

import 'cart_screen.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const routeName = '/my-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        actions: <Widget>[
          Consumer<CartProvider>(
              builder: (_, cart, ch) => CartBadge(
                    value: cart.itemCount.toString(),
                    color: Colors.blue,
                    child: ch!,
                  ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ))
        ],
      ),
      body: const ProductsOverviewScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/providers/gift_cart_provider.dart';
import 'package:test_drive/screens/gift_overview_screen.dart';
import 'package:test_drive/widgets/cart_badge.dart';

import 'gift_cart.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  static const routeName = '/gifts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gifts'),
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
                  Navigator.of(context).pushNamed(GiftCartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: const GiftOverviewScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/providers/gift_cart_provider.dart';

class GiftCartScreen extends StatelessWidget {
  const GiftCartScreen({super.key});

  static const routeName = '/gift-cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Gifts'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleLarge!
                            .color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(
                  cart.items.values.toList()[i].title,
                ),
                subtitle: Text(
                    'Total:\$${cart.items.values.toList()[i].price * cart.items.values.toList()[i].quantity}'),
                trailing: Text('x ${cart.items.values.toList()[i].quantity}'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

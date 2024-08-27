import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/models/product.dart';
import 'package:test_drive/providers/gift_cart_provider.dart';

import '../screens/gift_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              icon: const Icon(Icons.shopping_cart),
              color: Colors.blue),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              GiftDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.thumbnail,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

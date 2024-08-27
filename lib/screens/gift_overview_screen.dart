import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/providers/gifts_provider.dart';

import '../widgets/product_item.dart';

class GiftOverviewScreen extends StatelessWidget {
  const GiftOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<GiftsProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: const ProductItem(),
      ),
    );
  }
}

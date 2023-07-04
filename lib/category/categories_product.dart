import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class CategoriesProduct extends StatelessWidget {
  final List<Product> products;
  const CategoriesProduct({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItem(product: product);
        },
      ),
    );
  }
}

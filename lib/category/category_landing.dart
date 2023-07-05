import 'package:e_commerce_app/category/category_page.dart';
import 'package:flutter/material.dart';

class CategoryLanding extends StatelessWidget {
  const CategoryLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CategoryPage(),
      ),
    );
  }
}

import 'package:e_commerce_app/category/categories_product.dart';
import 'package:e_commerce_app/data/repository.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/screens/home/product_landing_page.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final products = await ProductRepository().getdata();
    final uniqueCategories =
        products.map((product) => product.category).toSet();
    setState(() {
      categories = uniqueCategories.toList();
    });
  }

  void fetchCategoryProducts(BuildContext context, String category) async {
    final products = await ProductRepository().getcategory(category: category);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriesProduct(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category),
            onTap: () {
              fetchCategoryProducts(context, category);
            },
          );
        },
      ),
    );
  }
}

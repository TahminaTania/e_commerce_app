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
  Map<String, int> categoryCounts = {};

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // Future<void> fetchCategories() async {
  //   final products = await ProductRepository().getdata();
  //   final uniqueCategories =
  //       products.map((product) => product.category).toSet();
  //   setState(() {
  //     categories = uniqueCategories.toList();
  //   });
  // }

  Future<void> fetchCategories() async {
    final products = await ProductRepository().getdata();
    final uniqueCategories =
        products.map((product) => product.category).toSet();
    final categoriesList = uniqueCategories.toList();
    setState(() {
      categories = categoriesList;
      //finding the products on each category.
      categoryCounts = {
        for (var category in categoriesList)
          category:
              products.where((product) => product.category == category).length,
      };
    });
  }

  void fetchCategoryProducts(BuildContext context, String category) async {
    final products = await ProductRepository().getcategory(category: category);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriesProduct(
          // category: category,
          products: products,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Categories'),
      // ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final productCount = categoryCounts[category] ?? 0;
          if (categories.length > 1) {
            return GestureDetector(
              onTap: () {
                fetchCategoryProducts(context, category);
              },
              child: ListTile(
                title: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: index.isOdd
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${productCount} Product")
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Text("No Categories on Item"),
            );
          }
        },
      ),
    );
  }
}

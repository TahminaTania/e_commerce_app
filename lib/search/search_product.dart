import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/data/repository.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProduct extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: Icon(Icons.close))];
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios));
    //  throw UnimplementedError();
  }

  // Future<List<Product>> _userData = ProductRepository().getdata();
  ProductRepository _userdata = ProductRepository();
  @override
  Widget buildResults(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);

    return FutureBuilder<List<Product>>(
      future: _userdata.getdata(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          if (products.isEmpty) {
            return Center(
              child: Text(
                "No results found for '$query'",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductItem(
                product: product,
                isfav: false,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("search here");
    // throw UnimplementedError();
  }
}

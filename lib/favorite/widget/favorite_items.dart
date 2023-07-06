import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartState) {
            final favItems = state.favItems;
            if (favItems.length > 0) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: favItems.length,
                itemBuilder: (context, index) {
                  final product = favItems[index];

                  print(" now fav length is --${favItems.length}");
                  return ProductItem(
                    product: product,
                    isfav: true,
                  );
                },
              );
            } else {
              print(" now fav length is --${favItems.length}");
              return Container(
                  child: Center(child: Text('No items added in Favourite')));
            }
          } else {
            return Center(
              child: Text('No items added in Favourite'),
            );
          }
        },
      ),
    );
  }
}

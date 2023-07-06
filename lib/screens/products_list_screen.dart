import 'package:e_commerce_app/Cart/cart_page.dart';
import 'package:e_commerce_app/Globals/responsiveSize.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchdata();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final cubit = context.read<ProductCubit>();
    //   cubit.fetchdata();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadedState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  // crossAxisCount: ResponsiveWidget.isLargeScreen(context)
                  //     ? 5
                  //     : ResponsiveWidget.isMediumScreen(context)
                  //         ? 3
                  //         : ResponsiveWidget.isSmallScreen(context)
                  //             ? 2
                  //             : 4,
                  // childAspectRatio: ResponsiveWidget.isLargeScreen(context)
                  //     ? 0.9
                  //     : ResponsiveWidget.isMediumScreen(context)
                  //         ? 3 / 2
                  //         : ResponsiveWidget.isSmallScreen(context)
                  //             ? 1.2
                  //             : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductItem(
                  product: product,
                  isfav: false,
                );
              },
            );
          } else {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(state.toString()),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

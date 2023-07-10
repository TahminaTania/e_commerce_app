import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce_app/Cart/cart_page.dart';
import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/details/widgets/image_box_widget.dart';
import 'package:e_commerce_app/details/widgets/product_actions_widget.dart';
import 'package:e_commerce_app/details/widgets/top_header_widget.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
              //color: Colors.amber,
              height: double.infinity,
              child: Stack(children: [
                Positioned(
                  child: ImageBoxWidget(product: product),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TopHeaderWidget()),
                Positioned(
                    top: 320,
                    bottom: 0,
                    child: ProductActionsWidget(product: product)),
                Positioned(
                    top: 450,
                    left: 10,
                    right: 10,
                    child: Container(
                        height: 250,
                        width: 350,
                        child: Text(
                          " Description: \n ${product.description}",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ))),
                Positioned(
                    bottom: 50,
                    right: 10,
                    left: 10,
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${product.price.toString()}\$",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(Icons.shopping_bag),
                                onPressed: () {
                                  context.read<CartCubit>().addToCart(product);
                                },
                              ),
                              Text(
                                "Add To Cart",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ])),
        );
      },
    ));
  }
}

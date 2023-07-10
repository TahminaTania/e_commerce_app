import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductActionsWidget extends StatelessWidget {
  final Product product;
  const ProductActionsWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final items = state.cartItems;
        return Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 500,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 162, 194, 198),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          product.title,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<CartCubit>(context)
                                        .incrementCount(product);
                                    print(" clicked add ");
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 15,
                                  )),
                            ),
                            Container(
                                child: Text(
                              product.productCount.toString(),
                              style: TextStyle(fontSize: 15, color: Colors.red),
                            )),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: IconButton(
                                  onPressed: () {
                                    if (items.contains(product)) {
                                      BlocProvider.of<CartCubit>(context)
                                          .decrementCount(product);
                                      print(" clicked removed ");
                                    } else {
                                      final snackBar = SnackBar(
                                        /// need to set following properties for best effect of awesome_snackbar_content
                                        elevation: 0,
                                        //behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: 'Not Found!',
                                          message:
                                              'You May be forgot to add the product on cart, Please add the product on cart first then try to remove item`s count!',

                                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                          contentType: ContentType.failure,
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 15,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
        );
      },
    );
  }
}

import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Handle product item click
        },
        child: Card(
          color: Color.fromARGB(255, 230, 226, 226),
          //height: 400,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 220,
                  width: 180,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  // color: Colors.black45,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 25,
                        child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                //borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(product.image)))
                            // child: Image(image: NetworkImage(product.image)),
                            ),
                      ),
                      Positioned(
                        top: 5,
                        right: 2,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  context.read<CartCubit>().addToCart(product);
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                  size: 18,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        //fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Price: \$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

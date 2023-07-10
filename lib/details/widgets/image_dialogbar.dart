import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';

class imageDialoge {
  static void showAlertDialog(
      BuildContext context, Product product, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.image), fit: BoxFit.contain)),
            ),
          ),
        );
      },
    );
  }
}

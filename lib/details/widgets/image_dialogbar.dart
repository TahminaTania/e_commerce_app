import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';

class imageDialoge {
  static void showAlertDialog(
      BuildContext context, Product product, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.image),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              Positioned(
                left: -30,
                top: 150,
                child: Container(
                  height: 50,
                  width: 30,
                  color: Colors.grey,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                right: -30,
                top: 150,
                child: Container(
                  height: 50,
                  width: 30,
                  color: Colors.grey,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

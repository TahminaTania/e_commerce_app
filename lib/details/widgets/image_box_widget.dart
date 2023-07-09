import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';

class ImageBoxWidget extends StatelessWidget {
  final Product product;
  const ImageBoxWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Stack(children: [
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: 350 / 4,
          left: MediaQuery.of(context).size.width * 0.25,
          child: Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.5,
            height: 350 * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.image), fit: BoxFit.contain),
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}

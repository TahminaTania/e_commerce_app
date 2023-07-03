import 'package:e_commerce_app/screens/home/smooth_page_slider.dart';
import 'package:e_commerce_app/screens/products_list_screen.dart';
import 'package:flutter/material.dart';

class ProductLandingPage extends StatelessWidget {
  const ProductLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            //color: Colors.brown,
            child: SmoothPageSlider(),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            //color: Colors.amber,
            child: ProductsListScreen(),
          ),
        ],
      ),
    );
  }
}

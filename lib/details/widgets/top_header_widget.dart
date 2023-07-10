import 'package:e_commerce_app/Cart/cart_page.dart';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:flutter/material.dart';

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // BlocProvider.of<ProductCubit>(context).home();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageBottom()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          Text(
            "detail Product",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 30,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

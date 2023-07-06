import 'package:e_commerce_app/favorite/widget/favorite_items.dart';
import 'package:e_commerce_app/favorite/widget/filter_options_widget.dart';
import 'package:e_commerce_app/favorite/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class FavoiritePage extends StatelessWidget {
  const FavoiritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(),
            Container(
              child: Text("My Favorite"),
            ),
            Container(
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ),
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
              height: 60,
              color: Colors.cyan.withOpacity(0.1),
              child:
                  OutlineSearchBar()), // using a package, have to inprove it, when i add functionalities
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            color: Colors.cyan.withOpacity(0.1),
            child: FilterOptionsWidget(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 500,
              color: Colors.cyan.withOpacity(0.1),
              child: FavoriteItems()),
        ],
      )),
    );
  }
}

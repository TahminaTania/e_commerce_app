import 'package:e_commerce_app/category/category_landing.dart';
import 'package:e_commerce_app/category/category_page.dart';
import 'package:e_commerce_app/screens/home/product_landing_page.dart';
import 'package:e_commerce_app/screens/home/profile_title_page.dart';
import 'package:e_commerce_app/screens/home/smooth_page_slider.dart';
import 'package:e_commerce_app/screens/products_list_screen.dart';
import 'package:flutter/material.dart';

class HomePageTopbar extends StatefulWidget {
  const HomePageTopbar({Key? key}) : super(key: key);

  @override
  _HomePageTopbarState createState() => _HomePageTopbarState();
}

class _HomePageTopbarState extends State<HomePageTopbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Category",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          title: ProfileTitlePage(),
        ),
        body: const TabBarView(
          children: [
            ProductLandingPage(),
            // SmoothPageSlider(),
            CategoryLanding()
            // Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}

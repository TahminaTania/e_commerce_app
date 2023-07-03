import 'package:e_commerce_app/Cart/cart_page.dart';
import 'package:e_commerce_app/screens/home/home_page_topbar.dart';
import 'package:e_commerce_app/screens/products_list_screen.dart';
import 'package:flutter/material.dart';

class HomePageBottom extends StatefulWidget {
  const HomePageBottom({Key? key}) : super(key: key);

  @override
  State<HomePageBottom> createState() => _HomePageBottomState();
}

class _HomePageBottomState extends State<HomePageBottom> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePageTopbar(),
    CartPage(),
    Text(
      'Index 1:',
      style: optionStyle,
    ),
    Text(
      'Index 3:',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(' E-com'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}

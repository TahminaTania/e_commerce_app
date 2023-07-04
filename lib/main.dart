import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/SignUp/formz_widget/formz_widget.dart';
import 'package:e_commerce_app/SignUp/sign_up.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';

import 'package:e_commerce_app/data/api_clients.dart';
import 'package:e_commerce_app/data/repository.dart';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:e_commerce_app/screens/home/smooth_page_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final apiClient = APIClient(baseUrl: 'https://fakestoreapi.com/products');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(repository: ProductRepository()),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'E-Commerce App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: HomePageBottom(),
          home: SignUp()),
    );
  }
}

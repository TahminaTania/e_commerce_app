import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/data/api_clients.dart';
import 'package:e_commerce_app/data/repository.dart';
import 'package:e_commerce_app/onboard/onboarding_screen/onboarding_screen.dart';
import 'package:e_commerce_app/onboard/onboarding_screen/scroll_page.dart';
import 'package:e_commerce_app/onboard/onboarding_screen/widgets/single_page_image.dart';
import 'package:e_commerce_app/onboard/splash/splash_screen.dart';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:e_commerce_app/settings/userProfile/pages/profile_page.dart';
import 'package:e_commerce_app/settings/userProfile/utils/user_preferences.dart';
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
    // final user = UserPreferences.myUser;
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
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: HomePageBottom(),
          //home: ProfilePage(),
          home: SplashScreen(),
        ));
  }
}

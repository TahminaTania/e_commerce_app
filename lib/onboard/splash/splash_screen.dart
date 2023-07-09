import 'dart:async';
import 'package:e_commerce_app/onboard/onboarding_screen/scroll_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ScrollPage())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Home Cloud",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "any Shopping Just from home",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ]),
      )),
    );
  }
}

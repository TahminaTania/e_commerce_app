import 'package:e_commerce_app/SignUp/formz_widget/formz_widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Formz Example')),
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(child: MyForm()),
        ),
      ),
    );
  }
}

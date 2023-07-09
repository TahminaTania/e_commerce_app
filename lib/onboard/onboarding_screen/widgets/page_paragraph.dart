import 'package:flutter/material.dart';

class PageParagraph extends StatelessWidget {
  const PageParagraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Text(
        " Various Collection Of Latest product paragraph page",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
      ),
    );
  }
}

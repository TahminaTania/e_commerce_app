import 'package:flutter/material.dart';

class SinglePageImage extends StatelessWidget {
  const SinglePageImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: MediaQuery.of(context).size.width * 0.8,
        // margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("images/cosmetics.png"),
            fit: BoxFit.cover,
          ),
        ));
  }
}



  //color: Colors.grey.withOpacity(0.5),
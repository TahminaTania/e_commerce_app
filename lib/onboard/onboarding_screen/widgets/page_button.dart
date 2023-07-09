import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  bool haveAcc;
  PageButton({Key? key, required this.haveAcc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      // color: Colors.deepPurple,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            haveAcc ? "Create Account" : "Already Have An Account",
            style:
                TextStyle(color: !haveAcc ? Colors.deepPurple : Colors.white),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: haveAcc ? Colors.deepPurple : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

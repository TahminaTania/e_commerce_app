import 'package:flutter/material.dart';

class ProfileTitlePage extends StatelessWidget {
  const ProfileTitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hy, User",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      "Lets Go shopping",
                      style: TextStyle(color: Colors.black26, fontSize: 10),
                    )
                  ],
                ),
              )
            ]),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

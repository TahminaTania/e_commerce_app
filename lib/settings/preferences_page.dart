import 'package:e_commerce_app/SignUp/sign_up.dart';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:flutter/material.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool islogged = false;
    final List<String> entries = <String>[
      'Legal & Policy',
      'Help & Support',
      islogged ? 'Log Out' : 'Log In',
    ];
    final List<int> colorCodes = <int>[600, 400, 100];
    final List<Icon> icon = <Icon>[
      Icon(Icons.policy),
      Icon(Icons.support),
      islogged ? Icon(Icons.logout_outlined) : Icon(Icons.login_outlined),
    ];
    return Container(
      height: 200,
      width: double.infinity,
      //color: Colors.amberAccent,
      child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              height: 50,
              color: Colors.grey[200],
              margin: EdgeInsets.all(8),
              // color: Colors.amber[colorCodes[index]],
              child: ListTile(
                title: Container(height: 30, child: Text("${entries[index]}")),
                leading: IconButton(
                  onPressed: () {},
                  icon: icon[index],
                  color: index == 2 && islogged
                      ? Colors.red
                      : index == 2
                          ? Colors.blue
                          : null,
                ),
                trailing: IconButton(
                    onPressed: () {
                      index == 2
                          ? Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp()))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageBottom()));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    )),
              ),
            );
          }),
    );
  }
}

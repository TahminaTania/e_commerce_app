import 'package:e_commerce_app/settings/userProfile/pages/profile_page.dart';
import 'package:flutter/material.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Edit Profile',
      'Change Password',
      'Notification',
      'Security',
      'Language'
    ];
    final List<int> colorCodes = <int>[600, 400, 300, 200, 100];
    final List<Icon> icon = <Icon>[
      Icon(Icons.person),
      Icon(Icons.lock),
      Icon(Icons.notifications),
      Icon(Icons.security),
      Icon(Icons.language)
    ];
    return Container(
      height: 320,
      width: double.infinity,
      // color: Colors.amberAccent,
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
                leading: IconButton(onPressed: () {}, icon: icon[index]),
                trailing: IconButton(
                    onPressed: () {
                      index == 0
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()))
                          : null;
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ),
            );
          }),
    );
  }
}

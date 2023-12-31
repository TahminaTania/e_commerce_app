import 'dart:io';
import 'package:e_commerce_app/settings/userProfile/model/user.dart';
import 'package:e_commerce_app/settings/userProfile/utils/user_preferences.dart';
import 'package:e_commerce_app/settings/userProfile/widget/profile_widget.dart';
import 'package:e_commerce_app/settings/userProfile/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// Copied from here---> https://flutterawesome.com/create-a-flutter-user-profile-page-ui-where-you-can-access-and-edit-information/

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      ),
    );
  }
}

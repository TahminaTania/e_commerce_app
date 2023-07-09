import 'package:e_commerce_app/onboard/onboarding_screen/widgets/page_button.dart';
import 'package:e_commerce_app/onboard/onboarding_screen/widgets/page_paragraph.dart';
import 'package:e_commerce_app/onboard/onboarding_screen/widgets/page_title.dart';
import 'package:e_commerce_app/onboard/onboarding_screen/widgets/single_page_image.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.cyan.withOpacity(0.1),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            SinglePageImage(),
            SizedBox(
              height: 10,
            ),
            PageTitle(),
            SizedBox(
              height: 5,
            ),
            PageParagraph(),
            SizedBox(
              height: 50,
            ),
            PageButton(
              haveAcc: true,
            ),
            SizedBox(
              height: 5,
            ),
            PageButton(
              haveAcc: false,
            )
          ],
        ),
      ),
    );
  }
}

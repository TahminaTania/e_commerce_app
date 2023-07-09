import 'package:e_commerce_app/onboard/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final PageController _pageController = PageController();
  int _activePage = 0;

  final List<Widget> _pages = [
    OnboardingScreen(),
    OnboardingScreen(),
    OnboardingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            // Positioned(top: 500, child: Text("Scroll Page")),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              height: 50,
              child: Container(
                // color: Colors.black54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      _pages.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: _activePage == index
                                    ? Colors.deepPurple
                                    : Colors.grey,
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

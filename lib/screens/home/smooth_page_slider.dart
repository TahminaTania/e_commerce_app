import 'package:e_commerce_app/screens/products_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageSlider extends StatefulWidget {
  const SmoothPageSlider({Key? key}) : super(key: key);

  @override
  State<SmoothPageSlider> createState() => _SmoothPageSliderState();
}

class _SmoothPageSliderState extends State<SmoothPageSlider> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        4,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 280,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
              ),
            ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  type: WormType.thinUnderground,
                ),
              ),

              // Container(
              //   height: 400,
              //   child: ProductsListScreen(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

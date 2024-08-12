import 'package:floodwatch_weather/views/contentSlider/sliderwidget1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getStartedScreen.dart';
import '../../theme/colors.dart';
import '../widgets/app gradient.dart';
import 'contentSlider2.dart';
class ContentSlider extends StatefulWidget {
  const ContentSlider({super.key});

  @override
  _ContentSliderState createState() => _ContentSliderState();
}

class _ContentSliderState extends State<ContentSlider> {
  final List<Widget Function()> pages = [
        // () => const SliderWidget(),
    // Add a function that returns the ClayCard widget
        () => const Slider2Widget(),
        () => const Slider3Widget(),
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.appGradients,
          borderRadius: BorderRadius.circular(
            30,
          ), // Optional: Set border radius to match FloatingActionButton
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.white,
          onPressed: () {
            if (_pageController.page == pages.length - 1) {
              // Navigate to the next page and clear the navigation stack
              Get.offAll(
                    () => const GetStartedScreen() ,
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500),
              );
            } else if (_pageController.page! < pages.length - 1) {
              // Navigate to the next page
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
              );
            }
          },
          child: Icon(
            CupertinoIcons.forward,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                // Call the function stored at the current index to get the widget
                Widget currentPage = pages[index]();

                return Center(
                  child: currentPage, // Display the retrieved widget
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
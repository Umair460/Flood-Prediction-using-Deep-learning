import 'package:flutter/material.dart';

import '../widgets/appColorcar.dart';
import '../widgets/appText.dart';
import '../widgets/contentWidget.dart';
import '../widgets/imageCard.dart';
class Slider3Widget extends StatelessWidget {
  const Slider3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppColorCard(),
                ContentWidget(
                  text1: AppText.enjoy,
                  text2: AppText.experience,
                  text3: AppText.enjoyIntro,
                ),
                const ImageCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
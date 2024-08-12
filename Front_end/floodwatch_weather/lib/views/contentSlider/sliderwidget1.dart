import 'package:flutter/material.dart';

import '../widgets/appColorcar.dart';
import '../widgets/appText.dart';
import '../widgets/contentWidget.dart';
import '../widgets/imageCard.dart';

class Slider2Widget extends StatelessWidget {
  const Slider2Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppColorCard(imageAsset: 'assets/tipimg2.jpg',),
                ContentWidget(
                  text1: AppText.trusted,
                  text2: AppText.corporate,
                  text3: AppText.trustedIntro,
                ),
                // const ImageCard(imageAsset: 'assets/fb.png',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:floodwatch_weather/views/widgets/app%20gradient.dart';
import 'package:floodwatch_weather/views/widgets/appText.dart';
import 'package:floodwatch_weather/views/widgets/gradientbtn.dart';
import 'package:floodwatch_weather/views/widgets/textWidget.dart';
import 'package:floodwatch_weather/views/widgets/welcomeBannerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            TextWidget(
              topPadding: 24.0,
              leftPadding: 16.0,
              bottomPadding: 6.0,
              text: AppText.welcomeT,
              textAlign: TextAlign.start,
              textStyle: Theme.of(context).textTheme.titleSmall,
            ),
            TextWidget(
              leftPadding: 16.0,
              rightPadding: 16.0,
              text: AppText.appName,
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                left: 16.0,
                right: 16.0,
              ),
              child: WavyAnimatedTextKit(
                text: [AppText.tagLine, AppText.tagLine2],
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                speed: const Duration(milliseconds: 500),
              ),
            ),
            const WelcomeBannerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: GradientButton(
                text: 'login',
                onPressed: () => Get.offAll(
                      () => const SignInScreen(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 28.0,
                right: 28.0,
                bottom: 16.0,
              ),
              child: GradientButton(
                text: AppText.registerText,
                onPressed: () => Get.offAll(
                      () => const SignUp(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
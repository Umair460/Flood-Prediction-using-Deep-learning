import 'package:floodwatch_weather/theme/colors.dart';
import 'package:floodwatch_weather/views/welcomeScreen.dart';
import 'package:floodwatch_weather/views/widgets/appText.dart';
import 'package:floodwatch_weather/views/widgets/customstackimage.dart';
import 'package:floodwatch_weather/views/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomStackWithImage(),
            TextWidget(
              leftPadding: 16.0,
              rightPadding: 16.0,
              text: AppText.getStarted,
              textStyle: TextStyle(fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.w500),
            ),
            TextWidget(
              topPadding: 8.0,
              leftPadding: 16.0,
              rightPadding: 16.0,
              text: AppText.startedIntro,
              textAlign: TextAlign.justify,
              textStyle: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width*0.80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                    ),
                    onPressed: (){
                      Get.offAll(
                            () => const WelcomeScreen(),
                        transition: Transition.upToDown,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    child: Text('started',style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
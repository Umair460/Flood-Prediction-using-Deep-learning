import 'package:firebase_auth/firebase_auth.dart';
import 'package:floodwatch_weather/views/dashboard.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../getStartedScreen.dart';
import '../views/contentSlider/contentSlider.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    // Delay for 2 seconds and navigate to the home screen
    Future.delayed(
      const Duration(seconds: 3),
          () async {
        checkUserLogin();
        // Navigate to the home screen
      },
    );
  }

  void checkUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
    try {
      // Check if the user is already logged in
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // User is already logged in, navigate to the home screen
        Get.offAll(
              () => MyHomePage(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 2000),
        );
      } else if (isFirstTimeUser == true){
        // User is not logged in, navigate to the login screen
        Get.offAll(
              () => const ContentSlider(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 2000),
        );
      }else {
        Get.offAll(
              () => const GetStartedScreen(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 2000),
        );
      }
    } catch (e) {
      // Handle any unexpected errors
      print('Error checking user login: $e');
      // Navigate to the login screen in case of any errors
      Get.off(
            () => const ContentSlider(),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 2000),
      );
    }
  }
}
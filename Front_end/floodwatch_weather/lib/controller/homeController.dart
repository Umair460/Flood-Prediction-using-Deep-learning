import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../getStartedScreen.dart';


class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> logout() async {
    try {
      _isLoading.value = true; // Show loading indicator
      await _auth.signOut();
      _isLoading.value = false; // Hide loading indicator
      Get.offAll(
            () => const GetStartedScreen(),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 2000),
      );// Navigate to the login page
    } catch (e) {
      _isLoading.value = false; // Hide loading indicator
      Get.snackbar('Oops', 'Failed to log out: $e');
    }
  }


  // void showModalBottomSheet() {
  //   Get.bottomSheet(
  //     const BottomAlertWidget(
  //     ),
  //     isScrollControlled: true, // Set to true if you want the modal to be full screen
  //   );
  // }

}
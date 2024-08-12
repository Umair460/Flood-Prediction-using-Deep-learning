import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../views/auth/login.dart';

class UserRegistrationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser({
    required String fullname,

    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save additional user data to FireStore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullname,

        'email': email,
      },);

      // Navigate to the home screen or next page
      Get.snackbar('Welcome', 'Welcome to the app!');
      // Navigate to next page
      Get.offAll(
            () => const SignInScreen(),
        transition: Transition.upToDown,
        duration: const Duration(milliseconds: 500),
      );
      // Get.off(const SignIn(),);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      } else {
        Get.snackbar('Error', 'An error occurred. Please try again later.');
      }
    } catch (e) {

      Get.snackbar('Error', 'An unexpected error occurred. Please try again later.');
    }
  }

  void showSnackBar(String s, String t, {required textColor}) {}
}
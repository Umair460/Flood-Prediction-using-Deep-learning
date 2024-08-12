import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floodwatch_weather/views/dashboard.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading.value = false;
      Get.offAll(const MyHomePage(),); // Navigate to HomeScreen after login
    } catch (e)
    {
      isLoading.value = false;
      String errorMessage = 'An error occurred. Please try again later.';
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'Invalid email address.';
            break;
          case 'user-not-found':
            errorMessage = 'User not found.';
            break;
          case 'wrong-password':
            errorMessage = 'Incorrect password.';
            break;
          default:
            errorMessage = 'Authentication failed. ${e.message}';
        }
      }
      Get.snackbar('Error', errorMessage);
    }
  }


}



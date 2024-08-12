import 'package:floodwatch_weather/services/auth.dart';
import 'package:floodwatch_weather/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FormValidator {
  static bool isAlpha(String value) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  }

  static bool isValidEmail(String value) {
    // return RegExp(r'^[\w-.]+@gmail\.com$').hasMatch(value);
    //with domain mails
    return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  // static bool isValidPhoneNumber(String value) {
  //   // Regex pattern for USA phone numbers
  //   RegExp regex = RegExp(r'^\+?1?\d{10}$');
  //   return regex.hasMatch(value);
  // }

  static void validateFields(
      TextEditingController fullNameController,

      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController,
      ) {
    String? firstNameError = fullNameController.text.isEmpty
        ? 'Please enter your first name'
        : (!isAlpha(fullNameController.text)
        ? 'First name should contain only alphabetic characters'
        : null);
    // String? lastNameError = lastNameController.text.isEmpty
    //     ? 'Please enter your last name'
    //     : (!isAlpha(lastNameController.text)
    //     ? 'Last name should contain only alphabetic characters'
    //     : null);
    String? emailError = emailController.text.isEmpty
        ? 'Please enter an email address'
        : (!isValidEmail(emailController.text)
        ? 'Please enter a valid email address'
        : null);
    String? passwordError =
    passwordController.text.isEmpty ? 'Please enter a password' : null;
    String? confirmPasswordError = confirmPasswordController.text.isEmpty
        ? 'Please confirm your password'
        : (confirmPasswordController.text != passwordController.text
        ? 'Passwords do not match'
        : null);
    // String? phoneNumberError = numberController.text.isEmpty
    //     ? 'Please enter your phone number'
    //     : (!isValidPhoneNumber(numberController.text)
    //     ? 'Please enter a valid USA phone number'
    //     : null);

    if (firstNameError != null) {
      Get.snackbar('Error', firstNameError);
    }
    // else if (lastNameError != null) {
    //   showSnackBar('Error', lastNameError);
    // }
    else if (emailError != null) {
      showSnackBar('Error', emailError);
    } else if (passwordError != null) {
      showSnackBar('Error', passwordError);
    } else if (confirmPasswordError != null) {
      showSnackBar('Error', confirmPasswordError);
    }
    // else if (phoneNumberError != null) {
    //   showSnackBar('Error', phoneNumberError);
    // }
    else {
      // All validations pass
      //Add Data Into Database
      UserRegistrationService().registerUser(
        fullname: fullNameController.text.trim(),

        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  static void showSnackBar(String title, String message,
      {Color textColor = Colors.black}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.appColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: textColor,
    );
  }

  static bool containsAlpha(String value) {
    return RegExp(r'[a-zA-Z]').hasMatch(value);
  }
}
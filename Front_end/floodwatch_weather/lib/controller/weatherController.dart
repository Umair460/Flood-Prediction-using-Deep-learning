import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../model/weatherModel.dart'; // Ensure you have the 'get' package installed

class WeatherServices {
  Future<WeatherData?> fetchWeather() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=31.587254&lon=74.404541&appid=509079b22fae7e954dff8403ef5eba0e"),
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        handleHttpErrors(response.statusCode);
      }
    } catch (e) {
      handleError(e);
    }
    return null;
  }

  void handleHttpErrors(int statusCode) {
    String message;
    switch (statusCode) {
      case 400:
        message = "Bad request. Please try again.";
        break;
      case 401:
        message = "Unauthorized access. Check your API key.";
        break;
      case 404:
        message = "Data not found. Check the provided location.";
        break;
      case 500:
        message = "Server error. Please try again later.";
        break;
      default:
        message = "Failed to load weather data. Status code: $statusCode";
    }
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  void handleError(dynamic e) {
    String message;
    if (e is SocketException) {
      message = "Please check your internet connection.";
    } else if (e is FormatException) {
      message = "Bad response format.";
    } else {
      message = e.toString();
    }
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
    print(e.toString());
  }
}
// class WeatherServices {
//   fetchWeather() async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             "https://api.openweathermap.org/data/2.5/weather?lat=31.587254&lon=74.404541&appid=509079b22fae7e954dff8403ef5eba0e"),
//       );
//
//       // Checking the HTTP response status code
//       if (response.statusCode == 200) {
//         var json = jsonDecode(response.body);
//         return WeatherData.fromJson(json);
//       } else {
//         // Handle specific HTTP status codes
//         handleHttpErrors(response.statusCode);
//         throw Exception('Failed to load weather data');
//       }
//     } catch (e) {
//       // Catch and handle various types of errors
//       handleError(e);
//     }
//   }
//
//   // Function to handle different HTTP errors
//   void handleHttpErrors(int statusCode) {
//     switch (statusCode) {
//       case 400:
//         Get.snackbar("Error", "Bad request. Please try again.",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//         break;
//       case 401:
//         Get.snackbar("Error", "Unauthorized access. Check your API key.",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//         break;
//       case 404:
//         Get.snackbar("Error", "Data not found. Check the provided location.",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//         break;
//       case 500:
//         Get.snackbar("Error", "Server error. Please try again later.",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//         break;
//       default:
//         Get.snackbar(
//             "Error", "Failed to load weather data. Status code: $statusCode",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//     }
//   }
//
//   // Function to handle general errors
//   void handleError(dynamic e) {
//     if (e is SocketException) {
//       Get.snackbar("Network Error", "Please check your internet connection.",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.orange,
//           colorText: Colors.white);
//     } else if (e is FormatException) {
//       Get.snackbar("Error", "Bad response format.",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     } else {
//       Get.snackbar("Error", e.toString(),
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     }
//     print(e.toString());
//   }
// }

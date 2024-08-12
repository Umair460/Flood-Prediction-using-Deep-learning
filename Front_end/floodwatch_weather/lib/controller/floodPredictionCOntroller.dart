// lib/flood_prediction_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FloodPredictionController extends GetxController {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController rainfallController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController windSpeedController = TextEditingController();
  final TextEditingController cloudCoverageController = TextEditingController();

  var isLoading = false.obs;
  var predictionResult = ''.obs;

  bool areAllFieldsFilled() {
    return yearController.text.isNotEmpty &&
        monthController.text.isNotEmpty &&
        rainfallController.text.isNotEmpty &&
        humidityController.text.isNotEmpty &&
        windSpeedController.text.isNotEmpty &&
        cloudCoverageController.text.isNotEmpty;
  }

  Future<void> getPrediction() async {
    if (!areAllFieldsFilled()) {
      Get.snackbar(
        'Validation Error',
        'Please fill in all fields before submitting.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final String apiUrl = 'http://127.0.0.1:5000/predict';
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'Year': int.parse(yearController.text),
          'Month': int.parse(monthController.text),
          'Rainfall': double.parse(rainfallController.text),
          'Relative_Humidity': double.parse(humidityController.text),
          'Wind_Speed': double.parse(windSpeedController.text),
          'Cloud_Coverage': double.parse(cloudCoverageController.text),
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        predictionResult.value = result['prediction'];
        Get.snackbar(
          'Prediction Result',
          'Prediction: ${predictionResult.value}',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      } else {
        throw Exception('Failed to get prediction. Status Code: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      predictionResult.value = 'Error: Unable to connect to the server. Please check your network connection.';
      Get.snackbar(
        'Network Error',
        'Unable to connect to the server. Please check your network connection.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      predictionResult.value = 'Error: ${error.toString()}';
      Get.snackbar(
        'Error',
        'Failed to get prediction. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

// class FloodPredictionController extends GetxController {
//   final TextEditingController yearController = TextEditingController();
//   final TextEditingController monthController = TextEditingController();
//   final TextEditingController rainfallController = TextEditingController();
//   final TextEditingController humidityController = TextEditingController();
//   final TextEditingController windSpeedController = TextEditingController();
//   final TextEditingController cloudCoverageController = TextEditingController();
//
//   var isLoading = false.obs;
//   var predictionResult = ''.obs;
//
//   Future<void> getPrediction() async {
//     final String apiUrl = 'http://127.0.0.1:5000/predict';
//
//     isLoading.value = true;
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'Year': int.parse(yearController.text),
//           'Month': int.parse(monthController.text),
//           'Rainfall': double.parse(rainfallController.text),
//           'Relative_Humidity': double.parse(humidityController.text),
//           'Wind_Speed': double.parse(windSpeedController.text),
//           'Cloud_Coverage': double.parse(cloudCoverageController.text),
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         predictionResult.value = result['prediction'];
//         Get.snackbar(
//           'Prediction Result',
//           'Prediction: ${predictionResult.value}',
//           snackPosition: SnackPosition.BOTTOM,
//           duration: Duration(seconds: 3),
//         );
//       } else {
//         throw Exception('Failed to get prediction. Status Code: ${response.statusCode}');
//       }
//     } on SocketException catch (_) {
//       predictionResult.value = 'Error: Unable to connect to the server. Please check your network connection.';
//       Get.snackbar(
//         'Network Error',
//         'Unable to connect to the server. Please check your network connection.',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 3),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } catch (error) {
//       predictionResult.value = 'Error: ${error.toString()}';
//       Get.snackbar(
//         'Error',
//         'Failed to get prediction. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 3),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

//
// class FloodPredictionController extends GetxController {
//   // Text editing controllers for the input fields
//   final TextEditingController yearController = TextEditingController();
//   final TextEditingController monthController = TextEditingController();
//   final TextEditingController rainfallController = TextEditingController();
//   final TextEditingController humidityController = TextEditingController();
//   final TextEditingController windSpeedController = TextEditingController();
//   final TextEditingController cloudCoverageController = TextEditingController();
//
//   var isLoading = false.obs;
//   var predictionResult = ''.obs;
//
//   // Function to make the prediction request
//   Future<void> getPrediction() async {
//     final String apiUrl = 'http://127.0.0.1:5000/predict';
//
//     isLoading.value = true;
//
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'Year': int.parse(yearController.text),
//           'Month': int.parse(monthController.text),
//           'Rainfall': double.parse(rainfallController.text),
//           'Relative_Humidity': double.parse(humidityController.text),
//           'Wind_Speed': double.parse(windSpeedController.text),
//           'Cloud_Coverage': double.parse(cloudCoverageController.text),
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         predictionResult.value = result['prediction'];
//         Get.snackbar(
//           'Prediction Result',
//           'Prediction: ${predictionResult.value}',
//           snackPosition: SnackPosition.BOTTOM,
//           duration: Duration(seconds: 3),
//         );
//       } else {
//         throw Exception('Failed to get prediction. Status Code: ${response.statusCode}');
//       }
//     } catch (error) {
//       predictionResult.value = 'Error: ${error.toString()}';
//       Get.snackbar(
//         'Error',
//         'Failed to get prediction. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 3),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

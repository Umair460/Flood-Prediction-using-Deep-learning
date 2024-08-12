// lib/flood_prediction_screen.dart
import 'package:floodwatch_weather/views/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/floodPredictionCOntroller.dart';

class FloodPredictionScreen extends StatelessWidget {
  final FloodPredictionController controller = Get.put(FloodPredictionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: controller.yearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Year',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.monthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Month',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.rainfallController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Rainfall',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.humidityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Relative Humidity',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.windSpeedController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Wind Speed',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cloudCoverageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Cloud Coverage',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: controller.areAllFieldsFilled() && !controller.isLoading.value
                  ? controller.getPrediction
                  : null,
              child: controller.isLoading.value
                  ? CircularProgressIndicator()
                  : Text('Get Prediction'),
            )),
            SizedBox(height: 20),
            Obx(() => Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Prediction: ${controller.predictionResult.value}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
// class FloodPredictionScreen extends StatelessWidget {
//   final FloodPredictionController controller = Get.put(FloodPredictionController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flood Prediction'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: controller.yearController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Year'),
//             ),
//             TextField(
//               controller: controller.monthController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Month'),
//             ),
//             TextField(
//               controller: controller.rainfallController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Rainfall'),
//             ),
//             TextField(
//               controller: controller.humidityController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Relative Humidity'),
//             ),
//             TextField(
//               controller: controller.windSpeedController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Wind Speed'),
//             ),
//             TextField(
//               controller: controller.cloudCoverageController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Cloud Coverage'),
//             ),
//             SizedBox(height: 20),
//             Obx(() => controller.isLoading.value
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: controller.getPrediction,
//               child: Text('Get Prediction'),
//             )),
//             SizedBox(height: 20),
//             Obx(() => Text(
//               'Prediction: ${controller.predictionResult.value}',
//               style: TextStyle(fontSize: 18),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }


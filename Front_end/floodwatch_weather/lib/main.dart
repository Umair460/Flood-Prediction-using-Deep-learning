import 'package:firebase_core/firebase_core.dart';
import 'package:floodwatch_weather/theme/colors.dart';
import 'package:floodwatch_weather/views/auth/login.dart';
import 'package:floodwatch_weather/views/auth/signup.dart';
import 'package:floodwatch_weather/views/dashboard.dart';
import 'package:floodwatch_weather/views/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controller/splashController.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,

  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
      runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
   
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.grey),
        useMaterial3: true,
      ),
        //home:S(),
         home: SplashScreen(),
        initialBinding: BindingsBuilder(
              () {
            //del this controller after check
            /*Get.put(
            MapPolyController(),
          );*/
            Get.put(
              SplashController(),
            );

          },
        ),
    );
  }
}


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import 'app gradient.dart';
import 'customstackimage.dart';

class SplashScreenDesign extends StatelessWidget {
  const SplashScreenDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomStackWithImage(
            height1: MediaQuery.of(context).size.height * 0.2,
            height2: MediaQuery.of(context).size.height * 0.2,
            imagePath: 'assets/flood.png',
          ),
          Text(
            'Flood Prediction',
            style: GoogleFonts.aBeeZee(
                fontSize: 35.0, fontWeight: FontWeight.w800,color: Colors.white
            )
          ),
          // TextLiquidFill(
          //   text: 'Flood Prediction',
          //   waveColor: Colors.deepPurpleAccent,
          //   loadDuration: const Duration(seconds: 4),
          //   waveDuration: const Duration(seconds: 3),
          //   //textStyle: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w800),
          //   boxHeight: 300.0,
          // ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppGradients.appGradients,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(60),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/flood.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
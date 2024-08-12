import 'package:flutter/material.dart';

import 'app gradient.dart';
class CustomStackWithImage extends StatelessWidget {
  final double? height1;
  final double? height2;
  final double? width;
  final String? imagePath;

  const CustomStackWithImage({
    Key? key,
    this.height1,
    this.height2,
    this.width,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            height: height1 ?? MediaQuery.of(context).size.height * 0.3,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradients.appGradients,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height2 ?? MediaQuery.of(context).size.height * 0.4,
          width: width ?? double.infinity,
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              imagePath ?? 'assets/flood.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
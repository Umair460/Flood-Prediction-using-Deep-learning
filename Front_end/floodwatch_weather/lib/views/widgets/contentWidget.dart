import 'dart:ui';

import 'package:floodwatch_weather/views/widgets/textWidget.dart';
import 'package:flutter/material.dart';

import 'appText.dart';

class ContentWidget extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;

  const ContentWidget({
    Key? key,
    this.text1,
    this.text2,
    this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        text1 != null
            ? TextWidget(
                topPadding: 24.0,
                leftPadding: 16.0,
                bottomPadding: 6.0,
                text: text1,
                textStyle: Theme.of(context).textTheme.titleLarge,
              )
            : TextWidget(
                topPadding: 24.0,
                leftPadding: 16.0,
                bottomPadding: 6.0,
                text: AppText.luxuryTransportation,
                textStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
        text2 != null
            ? TextWidget(
                leftPadding: 16.0,
                text: text2,
                textStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              )
            : TextWidget(
                leftPadding: 16.0,
                text: AppText.appName,
                textStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
        text3 != null
            ? TextWidget(
                text: text3,
                textAlign: TextAlign.justify,
                textStyle: TextStyle(fontSize: 13, color: Colors.white),
              )
            : TextWidget(
                text: AppText.appIntro,
                textAlign: TextAlign.justify,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}

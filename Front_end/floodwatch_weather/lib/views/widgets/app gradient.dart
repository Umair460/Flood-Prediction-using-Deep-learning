import 'package:flutter/material.dart';

import '../../theme/colors.dart';
class AppGradients {
  static var appGradient = LinearGradient(
    colors: [
      AppColors.appColor,
      AppColors.appColor2,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static var appGradients = LinearGradient(
    colors: [
     Colors.lightBlueAccent,
      Colors.indigo,
      Colors.blue

    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var appGradientShade = LinearGradient(
    colors: [
      AppColors.shade,
      AppColors.appColor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var textGradient = LinearGradient(
    colors: [
      AppColors.appColor,
      AppColors.textColor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var shadeGradient = LinearGradient(
    colors: [
      AppColors.shade,
      AppColors.textColor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static var transparentGradient = LinearGradient(
    colors: [

      Colors.transparent,
      AppColors.shade,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var background = LinearGradient(
    colors: [
      AppColors.bgColor1,
      AppColors.bgColor2,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
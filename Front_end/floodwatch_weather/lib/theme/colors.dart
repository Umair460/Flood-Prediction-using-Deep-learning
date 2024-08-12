import 'package:flutter/material.dart';
class AppColors{
  // static Color appColor = const Color(0xFFFFCA4B);
  static Color appColor = const Color(0xFFdbb47d);
  static Color appColor1 = const Color(0xffefad40);
  static Color appColor2 = const Color(0xFFF9D2C7);
  static Color shade = const Color(0xFF2e2e2e);
  static Color textColor = const Color(0xFFFFFFFF);
  static Color errorText = const Color(0xFFC62828);
  static Color bgColor1 = const Color(0xFF0B0B0B);
  static Color bgColor2 = const Color(0xFF2A2A2A);
  static Color blueCar = const Color(0xFF4E6584);
  static Color greyCar = const Color(0xFF8D9DB5);
  static Color greyShade = const Color(0xFFCAD2E5);
  static Color white = const Color(0xFFFFFFFF);
  static Color checkOutColor = const Color(0xFFFFE0B2);
  static Color greyColor = const Color(0xFFebebeb);
  static Color brown = const Color(0xFF763E01);
  static Color greyLight = const Color(0xFFF3F3F3);
  static Color grey = const Color(0xFFA5A5A5);
  static Color blue = const Color(0xFF1877F1);
  static Color backgroundColor = const Color(0xFF000000);
  static Color yellow = const Color(0xFFFF9100);
  static Color silver = const Color(0xFFE8EAF6);
  static Color lightGrey = const Color(0xFFE0E0E0);
  static Color gold = const Color(0xFF8B7831);
  static Color red = const Color(0xFF6A060E);
  static Color green = const Color(0xFF2AD045);

  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;
    const lowDivisor = 6;
    const highDivisor = 5;
    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;
    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}


const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        lightColorScheme.primary, // Slightly darker shade for the button
      ),
      foregroundColor:
      MaterialStateProperty.all<Color>(Colors.white), // text color
      elevation: MaterialStateProperty.all<double>(5.0), // shadow
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Adjust as needed
        ),
      ),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);
import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;
  final String? text;
  final int? maxLine;
  final TextStyle? textStyle;
  final TextAlign? textAlign; // Add nullable TextAlign property

  const TextWidget({
    Key? key,
    this.topPadding,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.maxLine,
    this.text,
    this.textStyle,
    this.textAlign, TextStyle? style, // Initialize the nullable TextAlign property
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
      child: Text(
        text ?? "",
        maxLines: maxLine,
        textAlign: textAlign, // Set the textAlign property here
        style: textStyle
            ?? Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  EdgeInsetsGeometry? get padding {
    if (topPadding != null || bottomPadding != null || leftPadding != null || rightPadding != null) {
      return EdgeInsets.only(
        top: topPadding ?? 0.0,
        bottom: bottomPadding ?? 0.0,
        left: leftPadding ?? 0.0,
        right: rightPadding ?? 0.0,
      );
    } else {
      return null;
    }
  }
}
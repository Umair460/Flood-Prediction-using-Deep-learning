import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class CustomRichText extends StatelessWidget {
  final String? text;
  final String? text2;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final VoidCallback? onPressed;
  final Alignment? alignment;

  const CustomRichText({
    Key? key,
    this.text,
    this.text2,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.onPressed,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: leftPadding ?? 16.0,
          right: leftPadding ?? 16.0,
          top: topPadding ?? 0.0,
          bottom: bottomPadding ?? 0.0,
        ),
        child: RichText(
          text: TextSpan(
            text: text ?? '',
            style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.white),
            children: [
              TextSpan(
                text: ' ${text2}',
                recognizer: TapGestureRecognizer()
                  ..onTap = onPressed ?? () {},
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.indigo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
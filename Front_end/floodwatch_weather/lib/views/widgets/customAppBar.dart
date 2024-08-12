import 'package:flutter/material.dart';

import 'app gradient.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height1;
  final double? height2;
  final double? width;
  final String? imagePath;
  final BorderRadiusGeometry? borderRadius;

  const CustomAppBar({
    Key? key,
    this.height1,
    this.height2,
    this.width,
    this.imagePath,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        children: [
          Container(
            height: height1 ?? MediaQuery.of(context).size.height * 0.2,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradients.appGradients,
              borderRadius: borderRadius ?? const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
            ),

          ),
          SizedBox(
            height: height2 ?? MediaQuery.of(context).size.height * 0.3,
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height2 ?? 100); // Change default height as needed
}
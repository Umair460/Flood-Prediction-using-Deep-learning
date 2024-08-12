import 'package:flutter/material.dart';

import 'appLoader.dart';
class WelcomeBannerWidget extends StatelessWidget {
  const WelcomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
                       // image: DecorationImage(
            //   image: AssetImage(
            //     'assets/fb.png',
            //   ),
            //   fit: BoxFit.contain,
            // ),
          ),
          child: AppLoader()
        ),
      ),
    );
  }
}
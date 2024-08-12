import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'app gradient.dart';
class ImageCard extends StatelessWidget {
  final String? imageAsset;
  const ImageCard({this.imageAsset,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.appColor,
          ),),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    // image: const DecorationImage(
                    //   image: AssetImage(
                    //     'assets/images/background.webp',
                    //   ),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),
              imageAsset != null
                  ?
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imageAsset!,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ) :
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/flood.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              )
              ,

            ],
          ),
        ),
      ),
    );
  }
}
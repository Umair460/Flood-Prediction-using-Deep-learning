import 'package:floodwatch_weather/views/widgets/appText.dart';
import 'package:floodwatch_weather/views/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../theme/colors.dart';
import 'clayContainer.dart';
class AppColorCard extends StatelessWidget {
  final String? imageAsset;
  final String? text1;
  final String? text2;
  const AppColorCard({Key? key,
    this.imageAsset,
    this.text1,this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      surfaceColor: AppColors.white,
      parentColor: AppColors.white,
      borderRadius: 20,
      depth: 60,
      spread: 0,
      curveType: CurveType.concave,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.26,
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                    AppColors.backgroundColor.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: imageAsset != null
                        ? Image.asset(
                      imageAsset!,
                      fit: BoxFit.fitHeight,
                    )
                        : Image.asset(
                      'assets/tipimg3.jpeg',
                      fit: BoxFit.fitHeight,
                    ), // Default image icon
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text1 != null
                      ? TextWidget(
                    topPadding: 16.0,
                    rightPadding: 8.0,
                    text: text1,
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ) : TextWidget(
                    topPadding: 16.0,
                    rightPadding: 8.0,
                    text: 'Welcome',
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  text2 != null
                      ? TextWidget(
                    topPadding: 2.0,
                    text: text2,
                    textStyle:
                    TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ) :
                  TextWidget(
                    topPadding: 2.0,
                    text: AppText.appName,
                    textStyle:
                    Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
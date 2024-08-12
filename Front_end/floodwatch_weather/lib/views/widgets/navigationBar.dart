import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:floodwatch_weather/views/weatherScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/navigationController.dart';
import '../../theme/colors.dart';
import '../floodScreen.dart';
import '../profileScreen.dart';

// class CustomNavigationBar extends StatelessWidget {
//   final List<Widget> pages = [
//     const FloodAIScreen(),
//     const WeatherHome(),
//     const ProfileScreen(),
//   ];
//   final NavigationController controller = Get.put(NavigationController());
//   final List<IconData> icons = [
//     Icons.home,
//     Icons.history,
//     CupertinoIcons.person,
//   ];
//
//   CustomNavigationBar({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Pages
//           Positioned.fill(
//             child: IndexedStack(
//               index: controller.currentIndex.value,
//               children: pages,
//             ),
//           ),
//           // Custom Navigation Bar
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: SafeArea(
//               child: DotNavigationBar(
//                 backgroundColor: AppColors.appColor,
//                 currentIndex: controller.currentIndex.value,
//                 onTap: controller.changePage,
//                 dotIndicatorColor: AppColors.backgroundColor,
//                 unselectedItemColor: AppColors.textColor,
//                 items: List.generate(
//                   pages.length,
//                       (index) => DotNavigationBarItem(
//                     icon: Icon(icons[index]),
//                     selectedColor: AppColors.backgroundColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:floodwatch_weather/views/widgets/app%20gradient.dart';
import 'package:floodwatch_weather/views/widgets/appLoader.dart';
import 'package:floodwatch_weather/views/widgets/appText.dart';
import 'package:floodwatch_weather/views/widgets/customAppBar.dart';
import 'package:floodwatch_weather/views/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../controller/homeController.dart';
import '../controller/profileController.dart';
import '../theme/colors.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final HomeController _controller = Get.put(HomeController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
        height2: 100,height1: 80,
      ),
      backgroundColor: Colors.blue.shade700,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.25,
            //   width: double.infinity,
            //   child: Stack(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 88.0, right: 10),
            //         child: Container(
            //           height: MediaQuery.of(context).size.height * 0.18,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             gradient: AppGradients.appGradients,
            //             borderRadius: const BorderRadius.only(
            //               bottomRight: Radius.circular(30),
            //               bottomLeft: Radius.circular(45),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         bottom: -8,
            //         right: 0,
            //         left: 0,
            //         child: Image.asset(
            //           height: MediaQuery.of(context).size.height * 0.2,
            //           'assets/flood.png',
            //           fit: BoxFit.contain,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Text(
              'Person Screen',
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 35
              ),
            ),
            // TextWidget(
            //   topPadding: 28,
            //   text: AppText.profilePersonal,
            //   textStyle: Theme.of(context).textTheme.titleLarge,
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 28.0,
                  right: 28.0,
                  left: 20.0,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 38.0,
                        right: 38,
                        top: 5.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueCar.withOpacity(0.2),
                              // Adjust the opacity as needed
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Text(''),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueCar.withOpacity(0.4),
                              // Adjust the opacity as needed
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Text(''),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueCar.withOpacity(0.4),
                              // Adjust the opacity as needed
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                          gradient: AppGradients.appGradients,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Obx(() {
                          var userData = _profileController.userData.value;
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  topPadding: 18,
                                  leftPadding: 16.0,
                                  rightPadding: 16.0,
                                  text: "Profile Name",
                                  textStyle:
                                  GoogleFonts.aBeeZee(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                                ),
                                TextWidget(
                                  text:
                                  '${userData['fullName'] }',
                                  textAlign: TextAlign.left,
                                  textStyle:
                                  GoogleFonts.aboreto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                                ),
                                TextWidget(
                                  leftPadding: 16.0,
                                  rightPadding: 16.0,
                                  text: "Profile Email",
                                  textStyle:
                                  GoogleFonts.aBeeZee(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                                ),
                                TextWidget(
                                  text: '${userData['email']}',
                                  textAlign: TextAlign.left,
                                  textStyle:
                                  GoogleFonts.aboreto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                                ),
                                // TextWidget(
                                //   leftPadding: 16.0,
                                //   rightPadding: 16.0,
                                //   text: "Profile Phone",
                                //   textStyle:
                                //   Theme.of(context).textTheme.labelLarge,
                                // ),
                                // TextWidget(
                                //   text: '${userData['phoneNumber']}',
                                //   textAlign: TextAlign.left,
                                //   textStyle:
                                //   Theme.of(context).textTheme.displayMedium,
                                // ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 40.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  child: InkWell(
                    onTap: _controller.isLoading ? null : _controller.logout,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            topPadding: 0,
                            bottomPadding: 0,
                            textAlign: TextAlign.center,
                            text: AppText.signOut,
                            textStyle:
                            GoogleFonts.aBeeZee(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )
                          ),
                          _controller.isLoading
                              ? const AppLoader()
                              : Lottie.asset(
                              height:
                              MediaQuery.of(context).size.height * 0.05,
                              width:
                              MediaQuery.of(context).size.height * 0.05,
                              'assets/loading.json'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class EditProfileScreen extends StatelessWidget {
//
//   String name;
//   String email;
//
//
//    EditProfileScreen({Key? key,
//     required this.name,
//     required this.email
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size mq = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Profile Screen')),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: Colors.redAccent,
//         onPressed: () async {
//           await FirebaseAuth.instance.signOut();
//           // Handle navigation to login screen
//         },
//         icon: const Icon(Icons.logout),
//         label: const Text('Logout'),
//       ),
//       body: Form(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(width: mq.width, height: mq.height * .03),
//                 // Stack(
//                 //   children: [
//                 //     Obx(() {
//                 //       return controller.imagePath.isNotEmpty
//                 //           ? ClipRRect(
//                 //           borderRadius: BorderRadius.circular(mq.height * .1),
//                 //           child: Image.file(File(controller.imagePath.value),
//                 //               width: mq.height * .2,
//                 //               height: mq.height * .2,
//                 //               fit: BoxFit.cover))
//                 //           : ClipRRect(
//                 //         borderRadius: BorderRadius.circular(mq.height * .1),
//                 //         child: CachedNetworkImage(
//                 //           width: mq.height * .2,
//                 //           height: mq.height * .2,
//                 //           fit: BoxFit.cover,
//                 //           imageUrl: controller.imageUrl.value,
//                 //           errorWidget: (context, url, error) =>
//                 //           const CircleAvatar(child: Icon(CupertinoIcons.person)),
//                 //         ),
//                 //       );
//                 //     }),
//                 //     Positioned(
//                 //       bottom: 0,
//                 //       right: 0,
//                 //       child: MaterialButton(
//                 //         elevation: 1,
//                 //         onPressed: () {
//                 //           _showBottomSheet(controller);
//                 //         },
//                 //         shape: const CircleBorder(),
//                 //         color: Colors.white,
//                 //         child: const Icon(Icons.edit, color: Colors.blue),
//                 //       ),
//                 //     )
//                 //   ],
//                 // ),
//                 SizedBox(height: mq.height * .03),
//                 Text(email, style: const TextStyle(color: Colors.black54, fontSize: 16)),
//                 SizedBox(height: mq.height * .05),
//                 TextFormField(
//                   initialValue: name,
//                   // onSaved: (val) => controller.name.value = val ?? '',
//                   // validator: (val) => val != null && val.isNotEmpty ? null : 'Required Field',
//                   // decoration: InputDecoration(
//                   //   prefixIcon: const Icon(Icons.person, color: Colors.blue),
//                   //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                   //   hintText: 'eg. Husnain Ali',
//                   //   label: const Text('Name'),
//                   // ),
//                 ),
//                 SizedBox(height: mq.height * .02),
//                 TextFormField(
//                   initialValue: controller.bio.value,
//                   onSaved: (val) => controller.bio.value = val ?? '',
//                   validator: (val) => val != null && val.isNotEmpty ? null : 'Required Field',
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.info_outline, color: Colors.blue),
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                     hintText: 'eg. Feeling Happy',
//                     label: const Text('Bio'),
//                   ),
//                 ),
//                 SizedBox(height: mq.height * .05),
//                 Builder(
//                   builder: (context) => ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       shape: const StadiumBorder(),
//                       minimumSize: Size(mq.width * .5, mq.height * .06),
//                     ),
//                     onPressed: () {
//                       if (Form.of(context).validate()) {
//                         Form.of(context).save();
//                         controller.updateUserInfo();
//
//
//                       }
//                     },
//                     icon: const Icon(Icons.edit, size: 28),
//                     label: Obx(() {
//                       return controller.isLoading.value
//                           ? CircularProgressIndicator()
//                           : const Text('UPDATE', style: TextStyle(fontSize: 16));
//                     }),
//                   ),
//                 )
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBottomSheet(ProfileController controller) {
//     showModalBottomSheet(
//       context: Get.context!,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       builder: (_) {
//         return ListView(
//           shrinkWrap: true,
//           padding: EdgeInsets.only(
//             top: MediaQuery.of(Get.context!).size.height * .03,
//             bottom: MediaQuery.of(Get.context!).size.height * .05,
//           ),
//           children: [
//             const Text(
//               'Pick Profile Picture',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: MediaQuery.of(Get.context!).size.height * .02),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: const CircleBorder(),
//                     fixedSize: Size(
//                       MediaQuery.of(Get.context!).size.width * .3,
//                       MediaQuery.of(Get.context!).size.height * .15,
//                     ),
//                   ),
//                   onPressed: () => controller.pickImage(ImageSource.gallery),
//                   child: Image.asset('assets/gallery.png'),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: const CircleBorder(),
//                     fixedSize: Size(
//                       MediaQuery.of(Get.context!).size.width * .3,
//                       MediaQuery.of(Get.context!).size.height * .15,
//                     ),
//                   ),
//                   onPressed: () => controller.pickImage(ImageSource.camera),
//                   child: Image.asset('assets/camera.png'),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

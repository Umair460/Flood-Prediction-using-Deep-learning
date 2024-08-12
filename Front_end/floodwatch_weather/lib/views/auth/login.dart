import 'package:floodwatch_weather/views/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../controller/authController.dart';
import '../../theme/colors.dart';
import '../widgets/app gradient.dart';
import '../widgets/appLoader.dart';
import '../widgets/customScafford.dart';
import '../widgets/inputtextwidget.dart';
import '../widgets/richText.dart';
import '../widgets/textWidget.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
    final LoginController _controller = Get.put(LoginController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //       value: rememberPassword,
                          //       onChanged: (bool? value) {
                          //         setState(() {
                          //           rememberPassword = value!;
                          //         });
                          //       },
                          //       activeColor: lightColorScheme.primary,
                          //     ),
                          //     const Text(
                          //       'Remember me',
                          //       style: TextStyle(
                          //         color: Colors.black45,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // GestureDetector(
                          //   child: Text(
                          //     'Forget password?',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: lightColorScheme.primary,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height:7,
                      ),
                                   Obx(
                () {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppGradients.appGradient,
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
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(10.0),
                        child: InkWell(
                          onTap: _controller.isLoading.value
                              ? null
                              : () {
                                  _controller.login(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                },
                          borderRadius: BorderRadius.circular(10.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _controller.isLoading.value
                                ? const AppLoader()
                                : Center(
                                    child: TextWidget(
                                        topPadding: 0,
                                        bottomPadding: 0,
                                        leftPadding: 0,
                                        rightPadding: 0,
                                        textAlign: TextAlign.center,
                                        text: 'Login',
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold)),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       if (_formSignInKey.currentState!.validate() &&
                      //           rememberPassword) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //             content: Text('Processing Data'),
                      //           ),
                      //         );
                      //       } else if (!rememberPassword) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //               content: Text(
                      //                   'Please agree to the processing of personal data')),
                      //         );
                      //       }
                      //     },
                      //     child: const Text('Sign up'),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Don\'t have account',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Logo(Logos.facebook_f),
                      //     Logo(Logos.twitter),
                      //     Logo(Logos.google),
                      //     Logo(Logos.apple),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Create an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                                        Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CustomRichText(
                  alignment: Alignment.center,
                  text2: 'SignUp',
                  onPressed: () => Get.offAll(
                    () => const SignUp(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),

              ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (e) => const SignUp(),
                          //       ),
                          //     );
                          //   },
                          //   child: Text(
                          //     'Terms & Condition',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: lightColorScheme.primary,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   final LoginController _controller = Get.put(LoginController());
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade300,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextWidget(
//                 topPadding: 24.0,
//                 leftPadding: 16.0,
//                 bottomPadding: 6.0,
//                 text: 'Lets Sig-In',
//                 textStyle: TextStyle(
//                     fontSize: 34,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               TextWidget(
//                 leftPadding: 16.0,
//                 text: 'Welcome Back!',
//                 textStyle: TextStyle(
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//
//               CustomRichText(
//                 text:
//                     'Experience Effortless Navigation and Seamless Journeys with',
//                 text2: 'Flood Prediction',
//               ),
//
//               TextWidget(
//                 topPadding: 20.0,
//                 leftPadding: 16.0,
//                 text: 'Email',
//                 textStyle: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold),
//               ),
//
//               InputTextField(
//                 hintText: 'Enter you email',
//                 textController: _emailController,
//                 prefixIcon: const Icon(CupertinoIcons.mail_solid),
//                 textInputType: TextInputType.emailAddress,
//               ),
//
//               TextWidget(
//                 leftPadding: 16.0,
//                 text: 'Password',
//                 textStyle: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold),
//               ),
//               InputTextField(
//                 hintText: 'Enter your password',
//                 obscureText: true,
//                 textController: _passwordController,
//                 prefixIcon: const Icon(CupertinoIcons.lock_slash_fill),
//                 textInputType: TextInputType.emailAddress,
//               ),
//
//               // Align(
//               //   alignment: Alignment.centerRight,
//               //   child: InkWell(
//               //     hoverColor: Colors.transparent,
//               //     onTap: () => Get.to(
//               //       const ForgotPasswordScreen(),
//               //       transition: Transition.rightToLeftWithFade,
//               //       duration: const Duration(milliseconds: 500),
//               //     ),
//               //     child: TextWidget(
//               //       textAlign: TextAlign.right,
//               //       text: forgotPassword,
//               //       textStyle: AppTextStyle.appFont(
//               //
//               //         gradient: AppGradients.appGradient,
//               //         useGradient: true,
//               //
//               //       ),
//               //     ),
//               //   ),
//               // ),
//
//               Obx(
//                 () {
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: AppGradients.appGradient,
//                         borderRadius: BorderRadius.circular(20.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: const Offset(0, 3), // Shadow position
//                           ),
//                         ],
//                       ),
//                       child: Material(
//                         color: Colors.indigo.shade900,
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: InkWell(
//                           onTap: _controller.isLoading.value
//                               ? null
//                               : () {
//                                   _controller.login(
//                                     _emailController.text.trim(),
//                                     _passwordController.text.trim(),
//                                   );
//                                 },
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10.0),
//                             child: _controller.isLoading.value
//                                 ? const AppLoader()
//                                 : Center(
//                                     child: TextWidget(
//                                         topPadding: 0,
//                                         bottomPadding: 0,
//                                         leftPadding: 0,
//                                         rightPadding: 0,
//                                         textAlign: TextAlign.center,
//                                         text: 'Login',
//                                         textStyle: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 23,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 6.0),
//                 child: CustomRichText(
//                   alignment: Alignment.center,
//                   text: 'Don\'t have an account?',
//                   text2: 'SignUp',
//                   onPressed: () => Get.offAll(
//                     () => const SignUp(),
//                     transition: Transition.rightToLeftWithFade,
//                     duration: const Duration(milliseconds: 500),
//                   ),
//                 ),
//               ),
//
//               // Center(
//               //   child: ElevatedButton(onPressed: () async {
//               //
//               //       User? user = FirebaseAuth.instance.currentUser;
//               //       if (user != null) {
//               //         String? token = await user.getIdToken();
//               //         print('User ID Token: $token');
//               //         print('User Email: ${user.email}');
//               //         print('User Name: ${user.displayName}');
//               //       } else {
//               //         print('User is not logged in');
//               //       }
//               //
//               //   }, child: Text("Test")),
//               // ),
//               // Center(
//               //   child: ElevatedButton(onPressed: () async {
//               //
//               //       User? user = FirebaseAuth.instance.currentUser;
//               //       FirebaseAuth.instance.signOut();
//               //       if (user != null) {
//               //         String? token = await user.getIdToken();
//               //         print('User ID Token: $token');
//               //         print('User Email: ${user.email}');
//               //         print('User Name: ${user.displayName}');
//               //         print('User no: ${user.phoneNumber}');
//               //       } else {
//               //         print('User is not logged in');
//               //       }
//               //
//               //   }, child: Text("Log out")),
//               // ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.0001,
//               ),
//               TextWidget(
//                   textAlign: TextAlign.center,
//                   text:
//                       'By continuing, you are agreeing our Terms, Conditions & Services.',
//                   textStyle: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

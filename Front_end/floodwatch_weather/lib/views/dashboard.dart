import 'package:floodwatch_weather/views/predictionScreen.dart';
import 'package:floodwatch_weather/views/profileScreen.dart';
import 'package:floodwatch_weather/views/tipScreen.dart';
import 'package:floodwatch_weather/views/weatherScreen.dart';
import 'package:floodwatch_weather/views/widgets/app%20gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../controller/weatherController.dart';
import '../model/weatherModel.dart';
import 'ContactScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData? weatherInfo;
  User? _currentUser;
  String? _name;
  String? _email;
  bool isLoading = true;
  String userName = "Loading...";
  String em = "";
  String userProfileImage = "assets/person.png";
  // Default profile image

  @override
  void initState() {
    super.initState();
    myWeather();
    _getCurrentUser();
  }

  myWeather() async {
    try {
      WeatherData? data = await WeatherServices().fetchWeather();
      setState(() {
        weatherInfo = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to load weather: $e");
    }
  }
  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _currentUser = user;
      });
      await _getUserDetails(user.uid);
    }
  }
  Future<void> _getUserDetails(String uid) async {
    try {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists) {
        setState(() {
          _name = userDoc['fullName'] ?? "No name";
          _email = userDoc['email'] ?? "No email";
        });
        print("User name: $_name");
        print("User email: $_email");
      } else {
        print("User document does not exist.");
        setState(() {
          _name = "No name";
          _email = "No email";
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        _name = "Error fetching name";
        _email = "Error fetching email";
      });
    }
  }


  // Future<void> fetchUserData() async {
  //   try {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       DocumentSnapshot userData = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .get();
  //
  //       if (userData.exists) {
  //         setState(() {
  //           userName = userData['fullname'];
  //           em = userData['email'];
  //           // userName = '${userData['firstName'] ?? "Unknown"} ${userData['lastName'] ?? "User"}';
  //           //userProfileImage = userData['profileImage'] ?? "assets/person.png"; // Use default image if profileImage is missing
  //         });
  //       } else {
  //         print("User document does not exist.");
  //         setState(() {
  //           userName = "Unknown User";
  //           //userProfileImage = "assets/person.png";
  //         });
  //       }
  //     } else {
  //       print("No user currently signed in.");
  //       setState(() {
  //         userName = "Unknown User";
  //         //userProfileImage = "assets/person.png";
  //       });
  //     }
  //   } catch (e) {
  //     print("Error fetching user data: $e");
  //     setState(() {
  //       userName = "Unknown User";
  //       userProfileImage = "assets/person.png";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    String formattedDate =
        DateFormat('EEEE d, MMMM yyyy').format(DateTime.now());

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: AppGradients.appGradients,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${weatherInfo?.temperature.current.toStringAsFixed(2)}°C",
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("assets/cloudy.png"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  weatherInfo != null
                                      ? WeatherDetail(
                                          weather: weatherInfo!,
                                          formattedDate: formattedDate,
                                          formattedTime: formattedTime,
                                        ).weatherInfoCard(
                                          title: "Wind",
                                          value:
                                              "${weatherInfo!.wind.speed}km/h")
                                      : Container(),
                                  Text(
                                    "${weatherInfo?.name ?? 'Unknown location'}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 33)
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.24,
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width * 0.22,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 30, // Adjust the size as needed
                                    backgroundImage:
                                        userProfileImage.contains('http')
                                            ? NetworkImage(userProfileImage)
                                            : AssetImage(userProfileImage)
                                                as ImageProvider,
                                    onBackgroundImageError: (_, __) {
                                      // Fallback to the default image if there is an error
                                      setState(() {
                                        userProfileImage = "assets/person.png";
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  _name ?? "Loading...",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                      ),
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 50,
                      children: [
                        InkWell(
                          child: itemDashboard(
                              '\t \tAI Flood \nPrediction',
                              CupertinoIcons.dot_radiowaves_left_right,
                              Colors.deepOrange),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloodPredictionScreen(),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          child: itemDashboard('\t \tWeather \nForecasting',
                              CupertinoIcons.graph_circle, Colors.green),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WeatherHome(),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          child: itemDashboard('Safety Tips',
                              CupertinoIcons.person_2, Colors.purple),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SafetyTipsScreen(),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          child: itemDashboard('Contact', CupertinoIcons.phone,
                              Colors.pinkAccent),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ContactPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
        bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(color: Colors.blue.shade700,borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),topRight: Radius.circular(35)
          )),
          
        ),
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background) =>
      Container(
        // height: MediaQuery.of(context).size.height*0.,
        // width: MediaQuery.of(context).size.width*0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        ),
      );
}

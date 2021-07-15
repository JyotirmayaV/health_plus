//import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/main.dart';
import 'package:Health_Plus/screens/bmi.dart';
import 'package:Health_Plus/screens/chat_screen.dart';
import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:Health_Plus/screens/details_screen.dart';
import 'package:Health_Plus/screens/steps_counter.dart';
import 'package:Health_Plus/screens/welcome_screen.dart';
import 'package:Health_Plus/screens/youtube_player.dart';
//import 'package:Health_Plus/widgets/bottom_nav_bar.dart';
import 'package:Health_Plus/widgets/category_card.dart';
//import 'package:Health_Plus/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //SharedPreferences prefs;

  String email = "";
  String name = "Welcome";

  Future<void> checkLoggedInStatus() async {
    //await setSharedPreference();

    //prefs = await SharedPreferences.getInstance();
    bool loggedInStatus = (prefs.getBool('loggedInStatus') ?? false);
    bool detailsFilled = (prefs.getBool('detailsFilled') ?? false);
    bool nameFetched = (prefs.getBool('nameFetched') ?? false);
    email = (prefs.getString('email'));

    print("detailsFilled : $detailsFilled, loggedInStatus : $loggedInStatus");

    var data = await _firestore.collection("users").doc(email).get();
    if (data['detailsFilled'] && detailsFilled == false) {
      detailsFilled = true;
      await prefs.setBool('detailsFilled', true);
    }

    if (detailsFilled == false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BMICalculator()),
        (Route<dynamic> route) => false,
      );
      print("detailsFilled : $detailsFilled, loggedInStatus : $loggedInStatus");
    } else if (nameFetched == true) {
      setState(() {
        name = prefs.getString('name');
      });
      print("name was found - $name");
    } else {
      print("name was not found");
      await getUser();
    }
  }

  Future<void> getUser() async {
    try {
      print("in home screen");
      // final user = await _auth.currentUser;
      // print("user $user");
      // if (user != null) {
      //  User loggedInUser = user;
      //  print("logged in user details $loggedInUser");
      var data = await _firestore.collection('users').doc(email).get();

      setState(() {
        name = data['name'];
      });

      await prefs.setString('name', name);
      await prefs.setBool('nameFetched', true);

      //print("data ");
      //print(data);
    } catch (e) {
      print("in exception");
      print(e);
    }
  }

  void setSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    print("i came here in home screen");
    checkLoggedInStatus();
    //getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    // this gonna give us total height and with of our device

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${name.split(" ").first}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceSansPro',
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                _auth.signOut();
                //remove screen from back as well
                await prefs.setBool('loggedInStatus', false);
                await prefs.setBool('nameFetched', false);
                await prefs.setBool('detailsFilled', false);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Workout",
                          svgSrc: "assets/icons/Exercises.svg",
                          press: () async {
                            await prefs.setString('videos', "Workout");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return YoutubePlayerDemoApp(
                                  currentsState: 'Workout',
                                );
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () async {
                            await prefs.setString('videos', "Meditation");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return YoutubePlayerDemoApp(
                                  currentsState: 'Meditation',
                                );
                              }),
                            );
                          },
                        ),
                        // CategoryCard(
                        //   title: "Yoga",
                        //   svgSrc: "assets/icons/Meditation.svg",
                        //   press: () {},
                        // ),
                        // CategoryCard(
                        //   title: "BMI Calci",
                        //   svgSrc: "assets/icons/Meditation.svg",
                        //   press: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) {
                        //         return BMICalculator();
                        //       }),
                        //     );
                        //   },
                        // ),
                        CategoryCard(
                          title: "COVID Analyser",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return COVIDanalyser();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Steps Counter",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return StepsCounter();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Community",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ChatScreen();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

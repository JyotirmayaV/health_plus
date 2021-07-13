import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/screens/bmi.dart';
import 'package:Health_Plus/screens/chat_screen.dart';
import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:Health_Plus/screens/details_screen.dart';
import 'package:Health_Plus/screens/steps_counter.dart';
import 'package:Health_Plus/screens/welcome_screen.dart';
import 'package:Health_Plus/widgets/bottom_nav_bar.dart';
import 'package:Health_Plus/widgets/category_card.dart';
import 'package:Health_Plus/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  User loggedInUser;

  String name = "Dear User";

  Future<void> getUser() async {
    try {
      print("in home screen");
      final user = await _auth.currentUser;
      print("user $user");
      if (user != null) {
        loggedInUser = user;
        print("logged in user details $loggedInUser");
        var data =
            await _firestore.collection('users').doc(loggedInUser.email).get();
        setState(() {
          name = data['name'];
        });
        print("data ");
        print(data);
      }
    } catch (e) {
      print("in exception");
      print(e);
    }
  }

  @override
  void initState() {
    print("i came here");
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    ;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0x0059b3),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _auth.signOut();
                      //remove screen from back as well
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.logout,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Welcome $name",

                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    //style: Theme.of(context)
                    //  .textTheme
                    //.display1
                    //.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
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
                          title: "Stretching",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "BMI Calculator",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return BMICalculator();
                              }),
                            );
                          },
                        ),
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
                          title: "Community Support",
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
            ),
          )
        ],
      ),
    );
  }
}

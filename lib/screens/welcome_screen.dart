import 'package:Health_Plus/main.dart';
import 'package:Health_Plus/screens/home_screen.dart';
import 'package:Health_Plus/screens/login_screen.dart';
import 'package:Health_Plus/screens/registration_screen.dart';
import 'package:Health_Plus/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //SharedPreferences prefs;

  Future<void> checkLoggedInStatus() async {
    //prefs = await SharedPreferences.getInstance();
    print("here1");
    bool loggedInStatus = prefs.getBool('loggedInStatus') ?? false;
    print("here2");
    print("loggedInStatus : $loggedInStatus");
    if (loggedInStatus == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      await SharedPreferences.setMockInitialValues(<String, dynamic>{
        "loggedInStatus": false,
        "detailsFilled": false,
        "nameFetched": false,
      });
      bool detailsFilled = (prefs.getBool('detailsFilled') ?? false);
      bool nameFetched = (prefs.getBool('nameFetched') ?? false);
      bool loggedInStatus = (prefs.getBool('loggedInStatus') ?? false);
      print(
          "detailsFilled : $detailsFilled, nameFetched : $nameFetched, loggedInStatus $loggedInStatus");
    }
  }

  void setSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    print("I came here in welcome screen");
    setSharedPreference();
    checkLoggedInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'animateLogo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Health Plus',
                      textStyle: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 500),
                    )
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  pause: const Duration(microseconds: 500),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonColor: Colors.lightBlueAccent,
              buttonText: 'Log In',
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              buttonColor: Colors.blue,
              buttonText: 'Register',
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatefulWidget {
  static const String id = "splash_screen";

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: WelcomeScreen(),
      title: Text(
        'Health Plus',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 40.0,
          fontWeight: FontWeight.w900,
        ),
      ),
      image: Image.asset('images/splash.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}

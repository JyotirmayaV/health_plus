import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/screens/bmi.dart';
import 'package:Health_Plus/screens/chat_screen.dart';
import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:Health_Plus/screens/details_screen.dart';
import 'package:Health_Plus/screens/home_screen.dart';
import 'package:Health_Plus/screens/login_screen.dart';
import 'package:Health_Plus/screens/registration_screen.dart';
import 'package:Health_Plus/screens/steps_counter.dart';
import 'package:Health_Plus/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health_Plus App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        StepsCounter.id: (context) => StepsCounter(),
        HomeScreen.id: (context) => HomeScreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
        COVIDanalyser.id: (context) => COVIDanalyser(),
        BMICalculator.id: (context) => BMICalculator(),
      },
    );
  }
}

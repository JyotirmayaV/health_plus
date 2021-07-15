import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/screens/bmi.dart';
import 'package:Health_Plus/screens/chat_screen.dart';
import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:Health_Plus/screens/details_screen.dart';
import 'package:Health_Plus/screens/diet_page.dart';
import 'package:Health_Plus/screens/home_screen.dart';
import 'package:Health_Plus/screens/login_screen.dart';
import 'package:Health_Plus/screens/registration_screen.dart';
import 'package:Health_Plus/screens/result_page_2.dart';
import 'package:Health_Plus/screens/splash_screen.dart';
import 'package:Health_Plus/screens/steps_counter.dart';
import 'package:Health_Plus/screens/welcome_diet.dart';
import 'package:Health_Plus/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

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
      initialRoute: MySplash.id,
      routes: {
        MySplash.id: (context) => MySplash(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        StepsCounter.id: (context) => StepsCounter(),
        HomeScreen.id: (context) => HomeScreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
        COVIDanalyser.id: (context) => COVIDanalyser(),
        BMICalculator.id: (context) => BMICalculator(),
        'welcome_diet': (context) => welcome_diet(),
        myapp.id: (context) => myapp(
              calorie_txt: '',
            ),
        CalorieResults.id: (context) =>
            CalorieResults(calorie_count: '', bmiAdvice: ''),
      },
    );
  }
}

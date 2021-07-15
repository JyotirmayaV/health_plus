import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/functionalities/toast.dart';
import 'package:Health_Plus/main.dart';
import 'package:Health_Plus/screens/home_screen.dart';
import 'package:Health_Plus/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  //SharedPreferences prefs;

  void setSharedPreference() async {
    //prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    print("i came here in login");
    // TODO: implement initState
    //setSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'animateLogo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter your email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter your password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                buttonColor: Colors.lightBlueAccent,
                buttonText: 'Log In',
                onPress: () async {
                  try {
                    prefs = await SharedPreferences.getInstance();
                    setState(() {
                      showSpinner = true;
                    });
                    print("clicked on log in");
                    final existingUser = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    print("new use is $existingUser");
                    await prefs.setString('email', email);
                    await prefs.setBool('loggedInStatus', true);
                    bool loggedInStatus =
                        (prefs.getBool('loggedInStatus') ?? false);
                    print("after login : $loggedInStatus");
                    setState(() {
                      showSpinner = false;
                    });
                    //remove screen from back as well
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false,
                    );
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                    String myError = e.toString().split("]").last;
                    MyToast.showMyToast(message: myError);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

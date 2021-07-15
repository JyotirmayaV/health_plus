import 'package:Health_Plus/screens/diet_page.dart';
import 'package:flutter/material.dart';

class welcome_diet extends StatefulWidget {
  //const welcome_diet({Key? key}) : super(key: key);

  @override
  _welcome_dietState createState() => _welcome_dietState();
}

TextEditingController textFieldController = TextEditingController();

class _welcome_dietState extends State<welcome_diet> {
  static const String id = "welcome_diet";

  @override
  Widget build(BuildContext context) {
    const kTextFieldDecoration = InputDecoration(
      hintText: 'Enter the value',
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Diet"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 150, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: textFieldController,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Target Calories'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75),
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      String textToSend = textFieldController.text;

                      textFieldController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => myapp(
                            calorie_txt: textToSend,
                          ),
                          settings: RouteSettings(
                            arguments: textToSend,
                          ),
                        ),
                      );
                    },
                    child: Text('Confirm'),
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      textFieldController.clear();
                    },
                    child: Text('Clear'),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

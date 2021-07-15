//import 'package:Health_Plus/widgets/bmi_calculator/reusable_card.dart';
//import 'package:Health_Plus/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CalorieResults extends StatelessWidget {
  final String calorie_count;
  final String bmiAdvice;
  static const String id = "result";

  CalorieResults({@required this.calorie_count, @required this.bmiAdvice});

  @override
  Widget build(BuildContext context) {
    const kBmiNumberTextStyle = TextStyle(
      fontSize: 35.0,
      fontWeight: FontWeight.w900,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie count'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Your Total Calorie Count',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Card(
              elevation: 25.0,
              child: ReusableCard(
                containerColor: Color(0xFFFFFFFE),
                cardChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /**  Text(
                        bmiResult,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green,
                        ),
                      ),*/
                      Text(
                        calorie_count,
                        style: kBmiNumberTextStyle.copyWith(
                          fontSize: 50.0,
                        ),
                      ),
                      Text(
                        bmiAdvice,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                onPress: () {},
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.blue.shade500,
              padding: EdgeInsets.only(bottom: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
              child: Center(
                child: Text(
                  'ADD-MORE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
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

class ReusableCard extends StatelessWidget {
  final Color containerColor;
  final Widget cardChild;
  final Function onPress;

  ReusableCard(
      {@required this.containerColor,
      @required this.cardChild,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: containerColor,
        ),
      ),
    );
  }
}

import 'package:Health_Plus/widgets/bmi_calculator/reusable_card.dart';
import 'package:Health_Plus/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BMIResults extends StatelessWidget {
  final String bmiResult;
  final String bmi;
  final String bmiAdvice;
  static const String id = "bmi_results";

  BMIResults(
      {@required this.bmiResult, @required this.bmi, @required this.bmiAdvice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Your Result',
                  style: kBmiNumberTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              containerColor: kBmiActiveIconColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      bmi,
                      style: kBmiNumberTextStyle.copyWith(
                        fontSize: 60.0,
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
                  'RE-CALCULATE',
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

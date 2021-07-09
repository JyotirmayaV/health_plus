import 'package:Health_Plus/widgets/bmi_calculator/reusable_card.dart';
import 'package:Health_Plus/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BMIResults extends StatelessWidget {
  const BMIResults({key}) : super(key: key);

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
                      'OVERWEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      '26.7',
                      style: kBmiNumberTextStyle.copyWith(
                        fontSize: 60.0,
                      ),
                    ),
                    Text(
                      'You have a higher than normal body weight. Try to exercise more.',
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

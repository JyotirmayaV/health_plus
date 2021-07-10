import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/widgets/bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepsCounter extends StatefulWidget {
  const StepsCounter({key}) : super(key: key);

  @override
  _StepsCounterState createState() => _StepsCounterState();
}

int stepsWalked = 10;
double caloriesBurnt = 12.0;
int goalSteps = 10000;
double percentWalked = 0.10;

enum ButtonState {
  START,
  PAUSE,
  RESUME,
}

ButtonState buttonCurrentState = ButtonState.START;

class _StepsCounterState extends State<StepsCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBmiBackgroundColor,
      appBar: AppBar(
        title: Text('Steps Counter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: ReusableCard(
              containerColor: kBmiActiveIconColor,
              cardChild: CircularPercentIndicator(
                radius: 300.0,
                percent: percentWalked,
                animation: true,
                lineWidth: 15.0,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.green,
                center: Text(
                  "$stepsWalked Steps",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Goal : $goalSteps Steps",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Calories Burnt',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          caloriesBurnt.toString(),
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  containerColor: kBmiActiveIconColor,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (buttonCurrentState != ButtonState.PAUSE) {
                              buttonCurrentState = ButtonState.PAUSE;
                            } else if (buttonCurrentState ==
                                ButtonState.PAUSE) {
                              buttonCurrentState = ButtonState.RESUME;
                            }
                          });
                        },
                        child: ReusableCard(
                          containerColor: kBmiActiveIconColor,
                          cardChild: Center(
                            child: Text(
                              buttonCurrentState.toString().split('.').last,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (buttonCurrentState != ButtonState.START) {
                              buttonCurrentState = ButtonState.START;
                            }
                          });
                        },
                        child: ReusableCard(
                          containerColor:
                              buttonCurrentState == ButtonState.START
                                  ? kBmiBackgroundColor
                                  : kBmiActiveIconColor,
                          cardChild: Center(
                            child: Text(
                              'STOP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Walking Time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '00:00:00',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  containerColor: kBmiActiveIconColor,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

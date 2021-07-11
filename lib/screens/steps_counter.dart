import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/widgets/bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';

class StepsCounter extends StatefulWidget {
  const StepsCounter({key}) : super(key: key);

  @override
  _StepsCounterState createState() => _StepsCounterState();
}

int stepsWalked = 20;
double caloriesBurnt = 12.0;
int goalSteps = 10000;
double percentWalked = 0.10;
Timer myTimer;

enum ButtonState {
  START,
  PAUSE,
  RESUME,
}
ButtonState buttonCurrentState = ButtonState.START;

enum StopButtonState {
  STOP,
  RESET,
}
StopButtonState stopButtonCurrentState = StopButtonState.STOP;

String walkingTime = "00:00:00";
final duration = const Duration(seconds: 1);
var myStopWatch = Stopwatch();
Timer constantCaller;

class _StepsCounterState extends State<StepsCounter> {
  void startTimer() {
    myStopWatch.start();
    constantCaller = Timer.periodic(duration, (timer) {
      startWalking();
      print("here in timer");
    });
  }

  void startWalking() {
    setState(() {
      print("here in keep running");
      walkingTime = myStopWatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (myStopWatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (myStopWatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
      print(walkingTime);
    });
  }

  void pause() {
    print("here in fun pause");
    myStopWatch.stop();
    constantCaller.cancel();
  }

  void stop() {
    print("here in stop");
    myStopWatch.stop();
    myStopWatch.reset();
    constantCaller.cancel();
  }

  void reset() {
    print("here in reset");
    setState(() {
      walkingTime = "00:00:00";
    });
  }

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
                      //START Button
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (stopButtonCurrentState ==
                                StopButtonState.STOP) {
                              if (buttonCurrentState != ButtonState.PAUSE) {
                                //user clicked on START or RESUME button
                                startTimer();
                                buttonCurrentState = ButtonState.PAUSE;
                              } else if (buttonCurrentState ==
                                  ButtonState.PAUSE) {
                                //User clicked on PAUSE button
                                pause();
                                buttonCurrentState = ButtonState.RESUME;
                              }
                            }
                          });
                        },
                        child: ReusableCard(
                          containerColor:
                              stopButtonCurrentState == StopButtonState.STOP
                                  ? kBmiActiveIconColor
                                  : kBmiBackgroundColor,
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
                      //STOP Button
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (stopButtonCurrentState ==
                                StopButtonState.RESET) {
                              //User clicked on RESET Button
                              reset();
                              stopButtonCurrentState = StopButtonState.STOP;
                            } else if (stopButtonCurrentState ==
                                StopButtonState.STOP) {
                              //User clciked on STOP button
                              stop();
                              stopButtonCurrentState = StopButtonState.RESET;
                              buttonCurrentState = ButtonState.START;
                            }
                          });
                        },
                        child: ReusableCard(
                          containerColor:
                              ((buttonCurrentState == ButtonState.START) &&
                                      (stopButtonCurrentState ==
                                          StopButtonState.STOP))
                                  ? kBmiBackgroundColor
                                  : kBmiActiveIconColor,
                          cardChild: Center(
                            child: Text(
                              stopButtonCurrentState.toString().split('.').last,
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
                          walkingTime.toString(),
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

import 'package:Health_Plus/functionalities/bmi_calculator/bmi_brain.dart';
import 'package:Health_Plus/screens/bmi_results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bmi_calculator/icon_content.dart';
import '../widgets/bmi_calculator/reusable_card.dart';
import 'package:Health_Plus/constants.dart';
import 'bmi_results.dart';

const Color activeCardColor = kBmiActiveIconColor;
const Color inactiveCardColor = kBmiBackgroundColor;

enum Gender {
  male,
  female,
}
int height = 180;
int age = 20;
int weight = 50;

Gender selectedGender = Gender.male;

class BMICalculator extends StatefulWidget {
  const BMICalculator({key}) : super(key: key);
  static const String id = "bmi";

  @override
  _BMICalculator createState() => _BMICalculator();
}

class _BMICalculator extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBmiBackgroundColor,
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    containerColor: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: ReusableCardChild(
                      childContainerIcon: FontAwesomeIcons.male,
                      childContainerText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    containerColor: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: ReusableCardChild(
                      childContainerIcon: FontAwesomeIcons.female,
                      childContainerText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              containerColor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kBmiLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kBmiNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kBmiLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double selectedHeight) {
                      setState(() {
                        height = selectedHeight.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    containerColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kBmiLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBmiNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                  if (weight == 0) weight = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    containerColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kBmiLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBmiNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                  if (age == 0) age = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMIMaths calc = BMIMaths(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BMIResults(
                          bmi: calc.getCalculatedBMI(),
                          bmiResult: calc.getResult(),
                          bmiAdvice: calc.getAdvice(),
                        )),
              );
            },
            child: Container(
              color: Colors.blue.shade500,
              padding: EdgeInsets.only(bottom: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
              child: Center(
                child: Text(
                  'CALCULATE',
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

class RoundIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final Function onPressed;

  RoundIconButton({this.buttonIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        height: 46.0,
        width: 46.0,
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: kBmiBackgroundColor,
      child: Icon(
        buttonIcon,
      ),
      onPressed: onPressed,
    );
  }
}

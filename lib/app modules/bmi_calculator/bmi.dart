import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:Health_Plus/constants.dart';

const Color activeCardColor = kBmiActiveIconColor;
const Color inactiveCardColor = kBmiBackgroundColor;

enum Gender {
  male,
  female,
}
int height = 180;

class BMICalculator extends StatefulWidget {
  const BMICalculator({key}) : super(key: key);

  @override
  _BMICalculator createState() => _BMICalculator();
}

class _BMICalculator extends State<BMICalculator> {
  Gender selectedGender;

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
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    containerColor: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue.shade500,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 70.0,
            child: Center(
              child: Text(
                'Calculate BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

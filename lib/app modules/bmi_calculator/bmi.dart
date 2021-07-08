import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({key}) : super(key: key);

  @override
  _BMICalculator createState() => _BMICalculator();
}

class _BMICalculator extends State<BMICalculator> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        containerColor: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: ReusableCardChild(
                          childContainerIcon: FontAwesomeIcons.male,
                          childContainerText: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        containerColor: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: ReusableCardChild(
                          childContainerIcon: FontAwesomeIcons.female,
                          childContainerText: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                containerColor: activeCardColor,
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
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
            ),
          ],
        ),
      ),
    );
  }
}

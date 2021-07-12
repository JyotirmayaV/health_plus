import 'package:Health_Plus/constants.dart';
import 'package:Health_Plus/functionalities/covid_analyser_brain.dart';
import 'package:Health_Plus/widgets/bmi_calculator/icon_content.dart';
import 'package:Health_Plus/widgets/bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color activeCardColor = kBmiActiveIconColor;
const Color inactiveCardColor = kBmiBackgroundColor;

int age = 20;

Map<String, bool> majorSymptom = {
  'Weakness': false,
  'Dry Cough': false,
  'Sore Throat': false,
  'Drowsiness': false,
  'Breathing Problems': false,
  'Pain in Chest': false,
  'Loss of Sense of Smell': false,
  'Change in Appetide': false,
};

Map<String, bool> majorDisease = {
  'Kidney Disease': false,
  'Heart Disease': false,
  'Lung Disease': false,
  'Diabetes': false,
  'High Blood Pressure': false,
  'Stroke or Reduced Immunity': false,
};

enum Gender {
  male,
  female,
}
Gender selectedGender = Gender.male;

enum Temperature {
  normal,
  fever,
  high_fever,
}
Temperature selectedTemperature = Temperature.normal;

enum SymptomsProgressed {
  yes,
  no,
}

enum TravelHistory {
  yes,
  no,
}
TravelHistory selectedForTravel = TravelHistory.no;

SymptomsProgressed selectedForSymptoms = SymptomsProgressed.no;

class COVIDanalyser extends StatefulWidget {
  const COVIDanalyser({key}) : super(key: key);
  static const String id = "covid_analyser";

  @override
  _COVIDanalyserState createState() => _COVIDanalyserState();
}

class _COVIDanalyserState extends State<COVIDanalyser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBmiBackgroundColor,
      appBar: AppBar(
        title: Text('COVID Analyser'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Row(
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
          ), //Gender
          ReusableCard(
            containerColor: kBmiActiveIconColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AGE',
                  style: kBmiLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$age',
                      style: kBmiNumberTextStyle,
                    ),
                    Text(
                      'years',
                      style: kBmiLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: age.toDouble(),
                  min: 10.0,
                  max: 100.0,
                  onChanged: (double selectedAge) {
                    setState(() {
                      age = selectedAge.round();
                    });
                  },
                ),
              ],
            ),
          ), //Age
          ReusableCard(
            containerColor: kBmiActiveIconColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'TEMPERATURE',
                    style: kBmiLabelTextStyle,
                  ),
                  RadioListTile(
                    title: Text('Normal (96°F-98.6°F)'),
                    value: Temperature.normal,
                    groupValue: selectedTemperature,
                    onChanged: (Temperature value) {
                      setState(() {
                        selectedTemperature = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Fever (98.6°F-102°F)'),
                    value: Temperature.fever,
                    groupValue: selectedTemperature,
                    onChanged: (Temperature value) {
                      setState(() {
                        selectedTemperature = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('High Fever (>102°F)'),
                    value: Temperature.high_fever,
                    groupValue: selectedTemperature,
                    onChanged: (Temperature value) {
                      setState(() {
                        selectedTemperature = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ), //Body Temperature
          ReusableCard(
            containerColor: kBmiActiveIconColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Major Symptoms', style: kBmiLabelTextStyle),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Please select all the symptoms that you are experiencing.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  for (int i = 0; i < majorSymptom.length; i++)
                    CheckboxListTile(
                      title: Text(
                        majorSymptom.keys.elementAt(i),
                      ),
                      value: majorSymptom[majorSymptom.keys.elementAt(i)],
                      onChanged: (value) {
                        setState(() {
                          majorSymptom[majorSymptom.keys.elementAt(i)] = value;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  Text(
                    'Have the symptoms progressed in the recent days ? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  RadioListTile(
                    title: Text('Yes'),
                    value: SymptomsProgressed.yes,
                    groupValue: selectedForSymptoms,
                    onChanged: (SymptomsProgressed value) {
                      setState(() {
                        selectedForSymptoms = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('No'),
                    value: SymptomsProgressed.no,
                    groupValue: selectedForSymptoms,
                    onChanged: (SymptomsProgressed value) {
                      setState(() {
                        selectedForSymptoms = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ), //Major Symptoms
          ReusableCard(
            containerColor: kBmiActiveIconColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Major Diseases', style: kBmiLabelTextStyle),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Please select all the diseases which you have been suffering from.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  for (int i = 0; i < majorDisease.length; i++)
                    CheckboxListTile(
                      title: Text(
                        majorDisease.keys.elementAt(i),
                      ),
                      value: majorDisease[majorDisease.keys.elementAt(i)],
                      onChanged: (value) {
                        setState(() {
                          majorDisease[majorDisease.keys.elementAt(i)] = value;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                ],
              ),
            ),
          ), //Major Diseases
          ReusableCard(
            containerColor: kBmiActiveIconColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Final Question',
                    style: kBmiLabelTextStyle,
                  ),
                  Text(
                    'Do you have any travel history to the infected countries ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  RadioListTile(
                    title: Text('Yes'),
                    value: TravelHistory.yes,
                    groupValue: selectedForTravel,
                    onChanged: (TravelHistory value) {
                      setState(() {
                        selectedForTravel = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('No'),
                    value: TravelHistory.no,
                    groupValue: selectedForTravel,
                    onChanged: (TravelHistory value) {
                      setState(() {
                        selectedForTravel = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ), //Final Question
          GestureDetector(
            onTap: () {
              setState(() {
                COVIDanalyserBrain ob = COVIDanalyserBrain(
                  majorSymptom: majorSymptom,
                  majorDisease: majorDisease,
                  selectedGender: selectedGender,
                  selectedTemperature: selectedTemperature,
                  selectedSymptoms: selectedForSymptoms,
                  selectedHistory: selectedForTravel,
                  age: age,
                );

                ob.selected();
              });
            },
            child: Container(
              color: Colors.blue.shade500,
              padding: EdgeInsets.only(bottom: 5.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: Text(
                  'TEST ME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          //Major Symptoms
        ],
      ),
    );
  }
}

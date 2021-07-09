import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:flutter/material.dart';

class COVIDanalyserBrain {
  final Map<String, bool> majorSymptom;
  final Map<String, bool> majorDisease;
  final Gender selectedGender;
  final Temperature selectedTemperature;
  final SymptomsProgressed selectedSymptoms;
  final TravelHistory selectedHistory;

  COVIDanalyserBrain(
      {@required this.majorSymptom,
      @required this.majorDisease,
      @required this.selectedGender,
      @required this.selectedTemperature,
      @required this.selectedSymptoms,
      @required this.selectedHistory});

  void selected() {
    print('Major Symptoms');
    for (int i = 0; i < majorSymptom.length; i++) {
      String mkey = majorSymptom.keys.elementAt(i);
      bool mval = majorSymptom[majorSymptom.keys.elementAt(i)];
      print('$mkey = $mval');
    }
    print('Major Diseases');
    for (int i = 0; i < majorDisease.length; i++) {
      String mkey = majorDisease.keys.elementAt(i);
      bool mval = majorDisease[majorDisease.keys.elementAt(i)];
      print('$mkey = $mval');
    }

    print("Gender : $selectedGender");
    print('Temperature : $selectedTemperature');
    print('Symptoms : $selectedSymptoms');
    print('History : $selectedHistory');
  } //closing of selected function
}

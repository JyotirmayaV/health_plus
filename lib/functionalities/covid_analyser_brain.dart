import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<int> dataEntered = [];

class COVIDanalyserBrain {
  final Map<String, bool> majorSymptom;
  final Map<String, bool> majorDisease;
  final Gender selectedGender;
  final Temperature selectedTemperature;
  final SymptomsProgressed selectedSymptoms;
  final TravelHistory selectedHistory;
  final int age;

  COVIDanalyserBrain({
    @required this.majorSymptom,
    @required this.majorDisease,
    @required this.selectedGender,
    @required this.selectedTemperature,
    @required this.selectedSymptoms,
    @required this.selectedHistory,
    @required this.age,
  });

  void selected() {
    dataEntered = [];

    dataEntered.add(selectedGender == Gender.male ? 0 : 1);

    dataEntered.add(majorSymptom['Drowsiness'] ? 1 : 0);

    dataEntered.add(majorSymptom['Sore Throat'] ? 1 : 0);

    dataEntered.add(majorSymptom['Weakness'] ? 1 : 0);

    dataEntered.add(majorSymptom['Breathing Problems'] ? 1 : 0);

    dataEntered.add(majorSymptom['Drowsiness'] ? 1 : 0);

    dataEntered.add(majorSymptom['Pain in Chest'] ? 1 : 0);

    dataEntered.add(selectedHistory == TravelHistory.yes ? 1 : 0);

    dataEntered.add(majorDisease['Diabetes'] ? 1 : 0);

    dataEntered.add(majorDisease['Heart Disease'] ? 1 : 0);

    dataEntered.add(majorDisease['Lung Disease'] ? 1 : 0);

    dataEntered.add(majorDisease['Stroke or Reduced Immunity'] ? 1 : 0);

    dataEntered.add(selectedSymptoms == SymptomsProgressed.yes ? 1 : 0);

    dataEntered.add(majorDisease['High Blood Pressure'] ? 1 : 0);

    dataEntered.add(majorDisease['Kidney Disease'] ? 1 : 0);

    dataEntered.add(majorSymptom['Change in Appetide'] ? 1 : 0);

    dataEntered.add(majorSymptom['Loss of Sense of Smell'] ? 1 : 0);

    for (int i = 10; i < 100; i += 10) {
      if (age >= i && age < i + 10)
        dataEntered.add(1);
      else
        dataEntered.add(0);
    }

    dataEntered.add(selectedTemperature == Temperature.fever ? 1 : 0);

    dataEntered.add(selectedTemperature == Temperature.high_fever ? 1 : 0);

    print(dataEntered);

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

    //getData();
  } //closing of selected function

  void getData() async {
    print("entered");
    var response = await http.get(
      Uri.http(
        '10.0.12.94',
        '/cgi-bin/detector.py',
        {'data': '123'},
      ),
    );
    print(response);
  }
}

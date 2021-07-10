import 'package:Health_Plus/screens/covid_analyser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<int> data_entered = [];

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
    data_entered = [];

    data_entered.add(selectedGender == Gender.male ? 0 : 1);

    data_entered.add(majorSymptom['Drowsiness'] ? 1 : 0);

    data_entered.add(majorSymptom['Sore Throat'] ? 1 : 0);

    data_entered.add(majorSymptom['Weakness'] ? 1 : 0);

    data_entered.add(majorSymptom['Breathing Problems'] ? 1 : 0);

    data_entered.add(majorSymptom['Drowsiness'] ? 1 : 0);

    data_entered.add(majorSymptom['Pain in Chest'] ? 1 : 0);

    data_entered.add(selectedHistory == TravelHistory.yes ? 1 : 0);

    data_entered.add(majorDisease['Diabetes'] ? 1 : 0);

    data_entered.add(majorDisease['Heart Disease'] ? 1 : 0);

    data_entered.add(majorDisease['Lung Disease'] ? 1 : 0);

    data_entered.add(majorDisease['Stroke or Reduced Immunity'] ? 1 : 0);

    data_entered.add(selectedSymptoms == SymptomsProgressed.yes ? 1 : 0);

    data_entered.add(majorDisease['High Blood Pressure'] ? 1 : 0);

    data_entered.add(majorDisease['Kidney Disease'] ? 1 : 0);

    data_entered.add(majorSymptom['Change in Appetide'] ? 1 : 0);

    data_entered.add(majorSymptom['Loss of Sense of Smell'] ? 1 : 0);

    for (int i = 10; i < 100; i += 10) {
      if (age >= i && age < i + 10)
        data_entered.add(1);
      else
        data_entered.add(0);
    }

    data_entered.add(selectedTemperature == Temperature.fever ? 1 : 0);

    data_entered.add(selectedTemperature == Temperature.high_fever ? 1 : 0);

    print(data_entered);

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

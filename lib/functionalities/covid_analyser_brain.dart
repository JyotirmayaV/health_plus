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

  void selected() async {
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

    await getData();
  } //closing of selected function

  void getData() async {
    print("entered");
    var response = await http.get(
      Uri.http(
        '192.168.43.250',
        '/cgi-bin/t1.py',
        {
          'a': '${dataEntered[0]}',
          'b': '${dataEntered[1]}',
          'c': '${dataEntered[2]}',
          'd': '${dataEntered[3]}',
          'e': '${dataEntered[4]}',
          'f': '${dataEntered[5]}',
          'g': '${dataEntered[6]}',
          'h': '${dataEntered[7]}',
          'i': '${dataEntered[8]}',
          'j': '${dataEntered[9]}',
          'k': '${dataEntered[10]}',
          'l': '${dataEntered[11]}',
          'm': '${dataEntered[12]}',
          'n': '${dataEntered[13]}',
          'o': '${dataEntered[14]}',
          'p': '${dataEntered[15]}',
          'q': '${dataEntered[16]}',
          'r': '${dataEntered[17]}',
          's': '${dataEntered[18]}',
          't': '${dataEntered[19]}',
          'u': '${dataEntered[20]}',
          'v': '${dataEntered[21]}',
          'w': '${dataEntered[22]}',
          'x': '${dataEntered[23]}',
          'y': '${dataEntered[24]}',
          'z': '${dataEntered[25]}',
          'aa': '${dataEntered[26]}',
          'ab': '${dataEntered[27]}',
        },
      ),
    );
    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

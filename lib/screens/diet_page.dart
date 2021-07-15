import 'package:Health_Plus/functionalities/toast.dart';
import 'package:Health_Plus/screens/result_page_2.dart';
import 'package:flutter/material.dart';

class myapp extends StatelessWidget {
  final String calorie_txt;
  List<dynamic> food_breakfast = [
    'Milk(1/2 cup)',
    'Chocolate milk (1 cup)',
    'Skim milk (1 cup)',
    'Black eye peas (1/2 cup)',
    'Refried beans (1/2 cup)',
    'Apple (1 medium)',
    'Apple juice (1 cup)',
    'Banana (1)',
    'Dates (dried)(10)',
    'Grape Juice (1 cup)',
    'Orange (1)',
    'Pear (1)',
    'Strawberries (1 cup)',
    'Watermelon (1 cup)',
    'Beans, Lima (1/2 cup cooked)',
  ];
  List<dynamic> cal_breakfast = [
    100,
    500,
    208,
    65,
    545,
    52,
    474,
    63,
    569,
    452,
    123,
    548,
    554,
    523,
    63,
  ];
  List<dynamic> food_lunch = [
    'Rice (Brown)',
    'Wheat whole',
    'Bulgar wheat',
    'Wheat flour',
    'Ragi',
    'Rice flakes',
    'Barley',
    'Jowar',
    'Amaranth seed, Black',
    'Cow pea, brown',
    'Red gram, dal',
    'Aalo Gobhi',
    'Aalo Palak',
    'Malai Chickan',
    'Egg Curry',
  ];
  List<dynamic> cal_lunch = [
    600,
    250,
    342,
    364,
    354,
    346,
    354,
    116,
    208,
    343,
    360,
    521,
    166,
    325,
    312,
  ];
  List<dynamic> food_evening = [
    'Salad',
    'Soup',
    'Chapati(wheat)',
    'Shahi Panner',
    'Dum Aloo',
    'Naeem Biryani',
    'Mutton',
    'Biryani',
    'Pan',
    'Matar Panner',
    'Kadai Panner',
    'Momos',
    'Malai Kofta',
    'Chole Bhature',
    'Manchurian-Naan'
  ];
  List<dynamic> cal_evening = [
    100,
    150,
    71,
    324,
    365,
    463,
    324,
    146,
    486,
    127,
    491,
    268,
    426,
    176,
    311,
  ];
  dynamic total_calories = 0;

  var size;
  myapp({@required this.calorie_txt});
  static const String id = "diet_page";

  @override
  Widget build(BuildContext context) {
    //final calorie_text = ModalRoute.of(context)!.settings.arguments;

    // print(calorie_text.runtimeType);
    size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            title: Center(
              child: Text(
                'Diet Chart',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          'Breakfast',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Lunch',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Dinner',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              InkWell(
                splashColor: Colors.white.withAlpha(30),
                child: TextButton(
                  onPressed: () {
                    print("Pressed");
                    // var info = {calorie_text, total_calories};

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalorieResults(
                          calorie_count: '$total_calories/$calorie_txt',
                          bmiAdvice: 'You are doing well!!! Keep it up...',
                        ),
                        settings: RouteSettings(
                            //arguments: info,
                            ),
                      ),
                    );
                    //Navigator.pushNamed(context, "/result2");
                  },
                  child: Icon(Icons.done_sharp),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.builder(
                itemCount: food_breakfast.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white60,
                    elevation: 25.0,
                    child: ListTile(
                      title: Text(food_breakfast[index]),
                      subtitle: Text(" ${cal_breakfast[index]} Calories"),
                      trailing: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          print("Pressed");
                          total_calories += cal_breakfast[index];
                          print("You have entered $total_calories calories");
                          MyToast.showMyToast(
                              message:
                                  "You have entered $total_calories calories");
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: food_lunch.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white60,
                    elevation: 25.0,
                    child: ListTile(
                      title: Text(food_lunch[index]),
                      subtitle: Text(" ${cal_lunch[index]} Calories"),
                      trailing: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          print("Pressed");
                          total_calories += cal_lunch[index];
                          print("You have entered $total_calories calories");
                          MyToast.showMyToast(
                              message:
                                  "You have entered $total_calories calories");
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: food_evening.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white60,
                    elevation: 25.0,
                    child: ListTile(
                      title: Text(food_evening[index]),
                      subtitle: Text(" ${cal_evening[index]} Calories"),
                      trailing: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          print("Pressed");
                          total_calories += cal_evening[index];
                          print("You have entered $total_calories calories");
                          MyToast.showMyToast(
                              message:
                                  "You have entered $total_calories calories");
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}

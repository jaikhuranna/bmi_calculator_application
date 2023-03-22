import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myweightController = TextEditingController();
  final myheightController = TextEditingController();

  int bmi = 0;

  @override
  Widget build(BuildContext context) {
    num theweight = int.tryParse(myweightController.text) ?? 0;
    num theheight = int.tryParse(myheightController.text) ?? 0;
    num heightInMeters = (theheight / 100);
    num theweightvalue = theweight;
    num heightinMetersSquare = heightInMeters * heightInMeters;
    double bmi = (theweightvalue / heightinMetersSquare);
    int userstatecase = 0;
    String userstate = "unknown";
    bool gender = true;
    int selectedIndex = 0;
    int counter = 11;
    String unitdescriptor;
    var colorOfUnits;
    var colorForCatagotyRepresentaion;
    var colorForCatagotyRepresentaionCard;
    void updateevethying() {
      setState(() {
        bmi = double.parse((bmi).toStringAsPrecision(2));
      });
    }

    void incrementCounter() {
      setState(() {
        counter++;
      });
    }

    if (counter % 2 == 0) {
      selectedIndex = 0;
    } else {
      selectedIndex = 1;
    }

    switch (selectedIndex) {
      case 0:
        unitdescriptor = "US system";
        colorOfUnits = Colors.red;
        break;
      case 1:
        unitdescriptor = "Metric system";
        colorOfUnits = Colors.green;
        break;
      default:
        unitdescriptor = "US system";
        colorOfUnits = Colors.red;
        break;
    }

    if (bmi < 16) {
      userstatecase = 1;
    }
    if (16 < bmi && bmi < 17) {
      userstatecase = 2;
    }
    if (17 < bmi && bmi < 18.5) {
      userstatecase = 3;
    }
    if (18.5 < bmi && bmi < 25) {
      userstatecase = 4;
    }
    if (25 < bmi && bmi < 30) {
      userstatecase = 5;
    }
    if (30 < bmi && bmi < 35) {
      userstatecase = 6;
    }
    if (35 < bmi && bmi < 40) {
      userstatecase = 7;
    }
    if (40 < bmi) {
      userstatecase = 8;
    }
    if (50 < bmi) {
      userstatecase = 9;
    }

    switch (userstatecase) {
      case 0:
        userstate = "unknown";
        colorForCatagotyRepresentaion = Colors.white;
        colorForCatagotyRepresentaionCard = Colors.black;

        break;
      case 1:
        userstate = "Severe Thinness";
        colorForCatagotyRepresentaion = Colors.white;
        colorForCatagotyRepresentaionCard = Colors.redAccent;

        break;
      case 2:
        userstate = "Moderate Thinness";
        colorForCatagotyRepresentaion = Colors.black;
        colorForCatagotyRepresentaionCard = Colors.amber;

        break;
      case 3:
        userstate = "Mild Thinness";
        colorForCatagotyRepresentaion = Colors.black;
        colorForCatagotyRepresentaionCard = Colors.amber;
        break;
      case 4:
        userstate = "Normal";
        colorForCatagotyRepresentaion = Colors.black;
        colorForCatagotyRepresentaionCard = Colors.greenAccent;
        break;
      case 5:
        userstate = "Overweight";
        colorForCatagotyRepresentaion = Colors.black;
        colorForCatagotyRepresentaionCard = Colors.amber;
        break;
      case 6:
        userstate = "Obese Class I";
        colorForCatagotyRepresentaion = Colors.white;
        colorForCatagotyRepresentaionCard = Colors.redAccent;
        break;
      case 7:
        userstate = "Obese Class II";
        colorForCatagotyRepresentaion = Colors.white;
        colorForCatagotyRepresentaionCard = Colors.redAccent;
        break;
      case 8:
        userstate = "Obese Class III";
        colorForCatagotyRepresentaion = Colors.white;
        colorForCatagotyRepresentaionCard = Colors.redAccent;
        break;
      case 9:
        userstate = "Hmm";
        colorForCatagotyRepresentaionCard = Colors.white;
        colorForCatagotyRepresentaion = Colors.redAccent;
        break;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    child: Card(
                      color: Colors.limeAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                            controller: myweightController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                                labelText: "Weight",
                                constraints: BoxConstraints(maxWidth: 100))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("/"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    child: Card(
                      color: Colors.limeAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                            controller: myheightController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                                labelText: "Height",
                                constraints: BoxConstraints(maxWidth: 100))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  unitdescriptor,
                  style: TextStyle(color: colorOfUnits),
                ),
              ),
              const Text(
                'Your BMI:',
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "$bmi",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text("You belong to the"),
                  ),
                  Card(
                    color: colorForCatagotyRepresentaionCard,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "$userstate catagory",
                        style: TextStyle(color: colorForCatagotyRepresentaion),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: incrementCounter, child: Text("$counter")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: updateevethying,
          tooltip: 'Unit change',
          child: const Icon(Icons.calculate_rounded),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

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
      title: 'BMI Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
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
    int selectedIndex = 0;
    int counter = 11;
    String nullthecatagory = "Catagory";
    String unitdescriptor;
    String stringbmi = bmi.toString();
    bmi = double.parse((bmi).toStringAsFixed(2));
    stringbmi = stringbmi.toString();
    stringbmi = stringbmi.substring(0, 5);

    String valueforeffectofinitialisation = "You belong to the ";
    var colorOfUnits;
    var colorForCatagotyRepresentaion;
    var colorForCatagotyRepresentaionCard;

    void updateevethying() {
      setState(() {
        stringbmi;
      });
    }

    //void incrementCounter() {
    //  setState(() {
    //    counter++;
    //  });
    //}

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
        colorOfUnits = Colors.lightGreen;
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
        userstate = "Press this to calculate BMI";
        colorForCatagotyRepresentaion = Colors.white;
        colorForCatagotyRepresentaionCard = Colors.black;
        valueforeffectofinitialisation = "Enter the values and ";
        nullthecatagory = "";
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
        nullthecatagory = "";
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
                  padding: const EdgeInsets.only(left: 20, right: 1),
                  child: Card(
                    color: Colors.lightGreenAccent,
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
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    "&",
                    textScaleFactor: 4,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1, right: 20),
                  child: Card(
                    color: Colors.lightGreenAccent,
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
              height: 15,
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
              height: 15,
            ),
            Card(
              color: Colors.lightGreenAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  stringbmi,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(valueforeffectofinitialisation),
                ),
                ElevatedButton(
                  onPressed: updateevethying,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorForCatagotyRepresentaionCard,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$userstate $nullthecatagory",
                      style: TextStyle(color: colorForCatagotyRepresentaion),
                    ),
                  ),
                ),
              ],
            ),
            //ElevatedButton(
            //    onPressed: incrementCounter, child: Text("$counter")),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: incrementCounter,
      //  tooltip: 'Unit change',
      //  backgroundColor: colorOfUnits,
      //  foregroundColor: Colors.black,
      //  child: const Icon(Icons.switch_access_shortcut),
      //)
    );
  }
}

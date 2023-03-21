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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
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

  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    num theweight = int.tryParse(myweightController.text) ?? 0;
    num theheight = int.tryParse(myheightController.text) ?? 0;
    num heightInMeters = (theheight / 100);
    //this probably fixed the issue
    theweight = theweight;
    num heightinMetersSquare = heightInMeters * heightInMeters;
    num bmi = (theweight / heightinMetersSquare);
    int userstatecase = 0;
    String userstate = "unknown";
    void updateevethying() {
      setState(() {
        bmi;
      });
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

    switch (userstatecase) {
      case 0:
        userstate = "unknown";
        break;
      case 1:
        userstate = "Severe Thinness";
        break;
      case 2:
        userstate = "Moderate Thinness";
        break;
      case 3:
        userstate = "Mild Thinness";
        break;
      case 4:
        userstate = "Normal";
        break;
      case 5:
        userstate = "Overweight";
        break;
      case 6:
        userstate = "Obese Class I";
        break;
      case 7:
        userstate = "Obese Class II";
        break;
      case 8:
        userstate = "Obese Class III";
        break;
      default:
        userstate = "unknown";
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
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
              const Text(
                'Your BMI:',
              ),
              const Text("Weight(Kgs) and Height^2(cm)"),
              const SizedBox(
                height: 7,
              ),
              Text(
                "$bmi",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text("You belong to the $userstate catagory")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Update BMI',
        onPressed: () {
          updateevethying();
        },
        child: const Icon(Icons.calculate_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
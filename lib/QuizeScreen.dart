import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gusstheflagmeeddtion/ResultScreen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuizeScreen(),
    );
  }
}

class QuizeScreen extends StatefulWidget {
  QuizeScreen();

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  List<String> countrise = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Monaco",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US"
  ];

  int num = Random().nextInt(3);
  int Ccounter=0;
  int Wcounter=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countrise.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              "guss the Flag? ",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Text(
              "${countrise[num]}",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 34,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            for (int i = 0; i < 3; i++)
              FlagButton(
                Name: countrise[i],
                onPressed: () {
                  if (num == i) {
                    Fluttertoast.showToast(
                        msg: "Correct answer", backgroundColor: Colors.green);
                        Ccounter++;
                  } else {
                    Fluttertoast.showToast(
                        msg: "Wrong answer", backgroundColor: Colors.red);
                        Wcounter++;
                  }
                  setState(() {
                    countrise.shuffle();
                     num = Random().nextInt(3);
                  });
                },
              ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultScreen(Wcounter: Wcounter,Ccounter: Ccounter,)));
                },
                child: Text("Result"))
          ],
        ),
      )),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({super.key, required this.Name, required this.onPressed});

  final String Name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Image.asset(
          "assets/countries/$Name.png",
          height: 150,
        ));
  }
}

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({required this.Wcounter,required this.Ccounter });
final int  Ccounter;
final int Wcounter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Correct answers = $Ccounter",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.green),
            ),
            SizedBox(
              height: 64,
            ),
            Text("wrong ansewr = $Wcounter",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.red))
          ],
        ),
      ),
    );
  }
}

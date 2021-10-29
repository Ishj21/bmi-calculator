import 'dart:core';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'reusable_card.dart';
import 'constants.dart';

class Results extends StatelessWidget {
  const Results(
      {@required this.bmi, @required this.bmiStatus, @required this.bmiInfo});
  final String bmi;
  final String bmiStatus;
  final String bmiInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'YOUR RESULT',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: ActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //here
                  Text(
                    bmiInfo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Container(
              child: Center(child: Text('Calculate Now')),
              // beautified :)
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

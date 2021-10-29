import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }

String getDetails() 
{
    if (_bmi >= 25) 
{
      return 'Your BMI is higher than average, this could lead to medical problems. \n Please try to lose your weight';
 } else if (_bmi > 18.5) 
{
      return 'You have a normal body BMI.  Keep Up and stay safe!';
  } 
else
 {
      return 'You have a lower BMI than normal. Please try to maintain your health by eating healthy food.';
  }
 }
}

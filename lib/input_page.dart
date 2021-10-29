import 'main.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  Color MaleCardColor = inActiveCardColor;
  Color FemaleCardColor = inActiveCardColor;
  int height = 185;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        color: selectedGender == Gender.male
                            ? ActiveCardColor
                            : inActiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.male,
                          text: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? ActiveCardColor
                            : inActiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.female,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelText,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumber,
                          ),
                          Text(
                            'CM',
                            style: kLabelText,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.pink[600],
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 35.0),
                            overlayColor: Color(0x36EB1555)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  color: ActiveCardColor,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          color: ActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: kLabelText,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumber,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIcon(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIcon(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    Expanded(
                      child: ReusableCard(
                          color: ActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: kLabelText,
                              ),
                              Text(
                                age.toString(),
                                style: kNumber,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIcon(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIcon(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  print(calc.calculate());

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Results(
                                bmi: calc.calculate(),
                                bmiInfo: calc.getDetails(),
                                bmiStatus: calc.getResult(),
                              )));
                },
                child: Container(
                  child: Center(child: Text('Calculate Now')),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: bottomContainerHeight,
                ),
              ),
            ],
          ),
        ));
  }
}

class RoundIcon extends StatelessWidget {
  @override
  RoundIcon({@required this.onPress, @required this.icon});
  final IconData icon;
  final Function onPress;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: onPress,
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}

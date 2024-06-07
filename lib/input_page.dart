import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icondata.dart';
import 'mcontainer.dart';
import 'calbmi.dart';
const iccolor = Color(0xFF1D1E33);
const ccolor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  child: mcontainer(
                      color: gender == Gender.male ? ccolor : iccolor,
                      cardChild: iconContent(
                        icon: const Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        text: 'MALE',
                      )),
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  child: mcontainer(
                      color: gender == Gender.female ? ccolor : iccolor,
                      cardChild: iconContent(
                        icon: const Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        text: 'FEMALE',
                      )),
                ),
              ),
            ]),
          ),
          mcontainer(
            color: ccolor,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      'cm',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98),
                      ),
                    )
                  ],
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double newVal) {
                      setState(() {
                        height = newVal.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              mcontainer(
                color: ccolor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: const Color(0xff4C4F5E),
                            shape: const CircleBorder(),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 10,
                          ),
                          FloatingActionButton(
                              backgroundColor: const Color(0xff4c4f5e),
                              shape: const CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        ],
                      )
                    ]),
              ),
              mcontainer(
                color: ccolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Text(
                      age.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w900),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: const Color(0xff4C4F5E),
                          shape: const CircleBorder(),
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xff4c4f5e),
                          shape: const CircleBorder(),
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          Container(
            color: const Color(0xFFFF0000),
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child:Center(
              child: GestureDetector(
                onTap: (){
                    calbmi k = calbmi(weight: weight, height: height);
                    print('abc');
                    print(k.getBMI());
                    Navigator.pushNamed(context, '/results',arguments: {'bmi':k.getBMI(), 'resultText':k.getResults(),'interpretation': k.getInterpretation()});
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

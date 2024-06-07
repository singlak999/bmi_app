import 'package:flutter/material.dart';
class Results extends StatelessWidget {
  const Results({super.key, required this.bmi, required this.resultText,required this.interpretation, Object? args});

  final String bmi;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF111328),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: const TextStyle(
                        color: Color(0xff24d876),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    bmi,
                    style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    interpretation,
                    style: const TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFFFF0000),
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child:Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Text(
                  'RECALCULATE',
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
        ],
      ),
    );
  }
}

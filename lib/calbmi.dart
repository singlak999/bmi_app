import 'dart:math';
class calbmi{
  final int weight;
  final int height;
  late double _bmi;
  calbmi({required this.weight, required this.height}){
  _bmi = weight / pow(height / 100, 2);
}
  String getBMI(){
    return _bmi.toStringAsFixed(1);
  }
  String getResults(){
    if (_bmi>=25){
      return'OVERWEIGHT';
    }
    else if(_bmi > 18.5){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }
  String getInterpretation(){
    if (_bmi>=25){
      return'You have a higher than normal body weight. Try to exercise more';
    }
    else if(_bmi > 18.5){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

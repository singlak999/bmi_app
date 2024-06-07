import 'package:bmi_app/results.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
        '/': (context) => const InputPage(),
        },
        onGenerateRoute: (settings){
          if (settings.name=='/results'){
            final args=settings.arguments as Map<String,dynamic>;
            return MaterialPageRoute(builder: (context){
              return Results(bmi: args['bmi'], resultText: args['resultText'], interpretation: args['interpretation']);
            });
          }
          return null;
        },
      theme:
      ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark().copyWith(
          surface: const Color(0xFF0A0E21),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
      )
    );
  }
}


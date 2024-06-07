import 'package:flutter/cupertino.dart';

class iconContent extends StatelessWidget {
  final Icon icon;
  final String text;
  iconContent({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

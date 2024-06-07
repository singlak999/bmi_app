import 'package:flutter/cupertino.dart';

class mcontainer extends StatelessWidget {
  late final Color color;
  late final Widget? cardChild;
  mcontainer( {super.key, required this.color, this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
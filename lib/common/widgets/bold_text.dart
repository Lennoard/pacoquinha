import 'package:flutter/material.dart';
import 'package:tabata/theme/colors.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color? color;
  const BoldText({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        height: 1.5,
        color: color ?? foregroundColor,
      ),
    );
  }
}

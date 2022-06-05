import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  const RegularText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

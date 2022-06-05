import 'package:flutter/material.dart';

class DisabledText extends StatelessWidget {
  final String text;
  const DisabledText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0XFFABB2BA),
      ),
    );
  }
}

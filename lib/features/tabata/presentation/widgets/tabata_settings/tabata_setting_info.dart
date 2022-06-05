import 'package:flutter/material.dart';

class SettingInfo extends StatelessWidget {
  final String assetPath;
  final String label;
  final String quantity;

  const SettingInfo(
      {Key? key,
      required this.assetPath,
      required this.label,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(assetPath),
            ),
            Text(label),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            quantity,
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

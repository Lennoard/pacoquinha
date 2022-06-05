import 'package:flutter/material.dart';

class TrainingInfo extends StatelessWidget {
  final ImageIcon imageIcon;
  final String label;
  final String quantity;

  const TrainingInfo({
    Key? key,
    required this.imageIcon,
    required this.label,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Row(
          children: [
            imageIcon,
            Text(
              quantity,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ],
    );
  }
}

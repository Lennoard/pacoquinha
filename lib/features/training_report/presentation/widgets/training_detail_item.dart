import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/bold_text.dart';
import 'package:tabata/theme/colors.dart';

class TrainingDetailItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final Color? color;

  const TrainingDetailItem({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(
                  iconPath,
                ),
                color: tabataPurple[400],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: color ?? foregroundColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        BoldText(
          text: value,
          color: color ?? foregroundColor,
        ),
      ],
    );
  }
}

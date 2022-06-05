import 'package:flutter/material.dart';
import 'package:tabata/features/training/domain/entities/training_intensity.dart';
import 'package:tabata/theme/colors.dart';

class TrainingIntensityIcon extends StatelessWidget {
  final TrainingIntensity intensity;
  const TrainingIntensityIcon({
    Key? key,
    required this.intensity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (intensity) {
      case TrainingIntensity.light:
        return Container(
          decoration: BoxDecoration(
            color: lightIntensityColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(
                'assets/icons/ic_training_feel_light.png',
              ),
              color: Colors.white,
            ),
          ),
        );
      case TrainingIntensity.moderate:
        return Container(
          decoration: BoxDecoration(
            color: moderateIntensityColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(
                'assets/icons/ic_training_feel_moderate.png',
              ),
              color: Colors.white,
            ),
          ),
        );
      case TrainingIntensity.intense:
        return Container(
          decoration: BoxDecoration(
            color: intenseIntensityColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(
                'assets/icons/ic_training_feel_intense.png',
              ),
              color: Colors.white,
            ),
          ),
        );
    }
  }
}

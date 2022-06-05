import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/bold_text.dart';
import 'package:tabata/common/widgets/regular_text.dart';
import 'package:tabata/features/training/domain/entities/training_intensity.dart';
import 'package:tabata/theme/colors.dart';

class TrainingIntensityInfo extends StatelessWidget {
  final TrainingIntensity intensity;

  const TrainingIntensityInfo({Key? key, required this.intensity})
      : super(key: key);

  Widget getIconData() {
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

  String getIntensityLabel() {
    switch (intensity) {
      case TrainingIntensity.light:
        return "Treino Leve";
      case TrainingIntensity.moderate:
        return "Treino Moderado";
      case TrainingIntensity.intense:
        return "Treino Intenso";
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget intensityIcon = getIconData();
    String intensityLabel = getIntensityLabel();

    return Row(
      children: [
        Column(
          children: [
            intensityIcon,
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText(text: intensityLabel),
              const RegularText(
                text: "Treino de cardio: skipping, salto, polichinelo...",
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tabata/common/utils/instensity_label.dart';
import 'package:tabata/common/widgets/bold_text.dart';
import 'package:tabata/common/widgets/regular_text.dart';
import 'package:tabata/features/training/domain/entities/training_intensity.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_intensity_icon.dart';

class TrainingIntensityInfo extends StatelessWidget {
  final TrainingIntensity intensity;

  const TrainingIntensityInfo({Key? key, required this.intensity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String intensityLabel = getIntensityLabel(intensity);

    return Row(
      children: [
        Column(
          children: [
            TrainingIntensityIcon(intensity: intensity),
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

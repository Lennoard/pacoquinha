import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/custom_textbutton.dart';
import 'package:tabata/common/widgets/disabled_text.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_info.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_intensity.dart';

class TrainingItem extends StatelessWidget {
  final Training training;
  late final TrainingSettings _trainingSettings = training.settings;

  TrainingItem({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF22262A),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TrainingIntensityInfo(intensity: training.intensity),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TrainingInfo(
                      imageIcon: const ImageIcon(
                        AssetImage('assets/icons/ic_series.png'),
                      ),
                      label: "Séries",
                      quantity: _trainingSettings.seriesCount.toString(),
                    ),
                    TrainingInfo(
                      imageIcon: const ImageIcon(
                        AssetImage('assets/icons/ic_cicle.png'),
                      ),
                      label: "Ciclos",
                      quantity: _trainingSettings.cycleCount.toString(),
                    ),
                    TrainingInfo(
                      imageIcon: const ImageIcon(
                        AssetImage('assets/icons/ic_time_colored.png'),
                      ),
                      label: "Tempo total",
                      quantity: _trainingSettings.restingTime.toString(),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xFF2E3338),
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    imageIcon: const ImageIcon(
                      AssetImage('assets/icons/ic_return.png'),
                    ),
                    text: "Repetir tabata",
                    onPressed: () {},
                  ),
                  const DisabledText(text: "Seg | 23 Maio 22"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
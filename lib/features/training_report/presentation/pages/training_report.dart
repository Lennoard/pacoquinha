import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/custom_appbar.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/entities/training_intensity.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_item.dart';

class TrainingReportPage extends StatelessWidget {
  TrainingReportPage({Key? key}) : super(key: key);

  final List<Training> trainingList = [
    Training(
      id: 1,
      settings: const TrainingSettings(
        seriesCount: 10,
        seriesTime: 4,
        restingTime: 1,
        cycleCount: 3,
        cycleInterval: 5,
      ),
      time: DateTime.now(),
      intensity: TrainingIntensity.intense,
    ),
    Training(
      id: 1,
      settings: const TrainingSettings(
        seriesCount: 15,
        seriesTime: 3,
        restingTime: 2,
        cycleCount: 5,
        cycleInterval: 1,
      ),
      time: DateTime.now(),
      intensity: TrainingIntensity.moderate,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(title: "Seus treinos"),
      ),
      body: ListView.builder(
        itemCount: trainingList.length,
        itemBuilder: (context, index) {
          return TrainingItem(training: trainingList[index]);
        },
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}

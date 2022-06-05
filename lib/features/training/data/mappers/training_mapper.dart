import 'package:tabata/features/training/data/models/training_data.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';

class TrainingMapper {
  Training map(TrainingData trainingData) {
    return Training(
      id: trainingData.id,
      time: DateTime.parse(trainingData.timestamp),
      settings: TrainingSettings(
        seriesCount: trainingData.seriesCount,
        seriesTime: trainingData.seriesTime,
        restingTime: trainingData.restingTime,
        cycleCount: trainingData.cycleCount,
        cycleInterval: trainingData.cycleInterval,
      ),
    );
  }

  TrainingData unmap(Training training) {
    return TrainingData(
      id: training.id as int,
      timestamp: training.time.toIso8601String(),
      seriesTime: training.settings.seriesTime,
      seriesCount: training.settings.seriesCount,
      restingTime: training.settings.restingTime,
      cycleCount: training.settings.cycleCount,
      cycleInterval: training.settings.cycleInterval,
    );
  }
}

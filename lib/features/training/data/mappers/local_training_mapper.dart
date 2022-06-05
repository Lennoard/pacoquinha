import 'package:tabata/features/training/data/models/training_data.dart';
import 'package:tabata/features/training/domain/entities/training_intensity.dart';

class LocalTrainingSettingsMapper {
  Map<String, dynamic> map(TrainingData training) {
    return {
      'id': 0,
      'timestamp': training.timestamp,
      'seriesTime': training.seriesTime,
      'seriesCount': training.seriesCount,
      'restingTime': training.restingTime,
      'cycleCount': training.cycleCount,
      'cycleInterval': training.cycleInterval,
      'intensity': training.intensity,
    };
  }

  TrainingData unmap(Map<String, dynamic> map) {
    return TrainingData(
      id: map['id'],
      timestamp: map['timestamp'] as String,
      seriesTime: map['seriesTime'] as int,
      seriesCount: map['seriesCount'] as int,
      restingTime: map['restingTime'] as int,
      cycleCount: map['cycleCount'] as int,
      cycleInterval: map['cycleInterval'] as int,
      intensity: map['intensity'] as TrainingIntensity,
    );
  }
}

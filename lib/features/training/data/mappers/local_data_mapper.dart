import 'package:tabata/features/training/data/models/training_data.dart';

class LocalTrainingMapper {
  Map<String, dynamic> map(TrainingData trainingData) {
    return {
      'id': 0,
      'seriesTime': trainingData.seriesTime,
      'seriesCount': trainingData.seriesCount,
      'restingTime': trainingData.restingTime,
      'cycleCount': trainingData.cycleCount,
      'cycleInterval': trainingData.cycleInterval,
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
    );
  }
}

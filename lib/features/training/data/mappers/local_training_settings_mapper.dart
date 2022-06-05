import 'package:tabata/features/training/domain/entities/training_settings.dart';

class LocalTrainingSettingsMapper {
  Map<String, dynamic> map(TrainingSettings settings) {
    return {
      'id': 0,
      'seriesTime': settings.seriesTime,
      'seriesCount': settings.seriesCount,
      'restingTime': settings.restingTime,
      'cycleCount': settings.cycleCount,
      'cycleInterval': settings.cycleInterval,
    };
  }

  TrainingSettings unmap(Map<String, dynamic> map) {
    return TrainingSettings(
      seriesTime: map['seriesTime'] as int,
      seriesCount: map['seriesCount'] as int,
      restingTime: map['restingTime'] as int,
      cycleCount: map['cycleCount'] as int,
      cycleInterval: map['cycleInterval'] as int,
    );
  }
}

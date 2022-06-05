import 'package:equatable/equatable.dart';

class TrainingSettings extends Equatable {
  final int seriesTime;
  final int seriesCount;
  final int restingTime;
  final int cycleCount;
  final int cycleInterval;

  const TrainingSettings({
    required this.seriesCount,
    required this.seriesTime,
    required this.restingTime,
    required this.cycleCount,
    required this.cycleInterval,
  });

  factory TrainingSettings.defaultSettings() {
    return const TrainingSettings(
      seriesCount: 8,
      seriesTime: 20,
      restingTime: 10,
      cycleCount: 1,
      cycleInterval: 0,
    );
  }

  @override
  List<Object?> get props => [
    seriesTime,
    seriesCount,
    restingTime,
    cycleCount,
    cycleInterval
  ];
}

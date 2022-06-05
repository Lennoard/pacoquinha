import 'package:equatable/equatable.dart';
import 'package:tabata/features/training/domain/entities/training_intensity.dart';

class TrainingData extends Equatable {
  final int id;
  final String timestamp;
  final int seriesTime;
  final int seriesCount;
  final int restingTime;
  final int cycleCount;
  final int cycleInterval;
  final int intensity;

  const TrainingData({
    required this.id,
    required this.timestamp,
    required this.seriesTime,
    required this.seriesCount,
    required this.restingTime,
    required this.cycleCount,
    required this.cycleInterval,
    required this.intensity,
  });

  @override
  List<Object?> get props => [id];
}

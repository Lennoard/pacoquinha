import 'package:equatable/equatable.dart';

class TrainingData extends Equatable {
  final int id;
  final String timestamp;
  final int seriesTime;
  final int seriesCount;
  final int restingTime;
  final int cycleCount;
  final int cycleInterval;

  const TrainingData({
    required this.id,
    required this.timestamp,
    required this.seriesTime,
    required this.seriesCount,
    required this.restingTime,
    required this.cycleCount,
    required this.cycleInterval,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp,
      'seriesTime': seriesTime,
      'seriesCount': seriesCount,
      'restingTime': restingTime,
      'cycleCount': cycleCount,
      'cycleInterval': cycleInterval,
    };
  }

  @override
  List<Object?> get props => [id];
}

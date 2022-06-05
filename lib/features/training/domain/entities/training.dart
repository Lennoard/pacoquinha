import 'package:equatable/equatable.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';

class Training extends Equatable {
  final dynamic id;
  final DateTime time;
  final TrainingSettings settings;

  const Training({
    required this.id,
    required this.time,
    required this.settings,
  });

  @override
  List<Object?> get props => [time, settings];
}

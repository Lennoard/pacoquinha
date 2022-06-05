import 'package:dartz/dartz.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
import 'package:tabata/common/data/failures.dart';

abstract class TrainingSettingsDataSource {
  Future<Either<Failure, TrainingSettings>> getTrainingSettings();
  Future<Either<Failure, void>> saveTrainingSettings(TrainingSettings settings);
}

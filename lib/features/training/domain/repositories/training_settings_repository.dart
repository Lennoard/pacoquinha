import 'package:dartz/dartz.dart';

import '../datasources/data_sources.dart';
import '../entities/training_settings.dart';
import '../error/failures.dart';

abstract class TrainingSettingsRepository {
  Future<Either<Failure, TrainingSettings>> getTrainingSettings(
      DataSource source);

  Future<Either<Failure, void>> saveTrainingSettings(
      TrainingSettings settings, DataSource source);
}

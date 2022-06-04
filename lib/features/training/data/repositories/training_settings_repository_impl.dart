import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_settings_repository.dart';

class TrainingSettingsRepositoryImpl implements TrainingSettingsRepository {
  @override
  Future<Either<Failure, TrainingSettings>> getTrainingSettings(
      DataSource source) {
    // TODO: implement getTrainingSettings
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveTrainingSettings(
      TrainingSettings settings, DataSource source) {
    // TODO: implement saveTrainingSettings
    throw UnimplementedError();
  }
}

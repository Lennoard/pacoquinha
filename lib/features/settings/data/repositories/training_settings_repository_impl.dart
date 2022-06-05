import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/settings/domain/datasources/training_settings_data_source.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
import 'package:tabata/common/data/failures.dart';
import 'package:tabata/features/settings/domain/repositories/training_settings_repository.dart';

class TrainingSettingsRepositoryImpl implements TrainingSettingsRepository {
  final TrainingSettingsDataSource _localDataSource;
  final TrainingSettingsDataSource _firestoreDataSource;


  TrainingSettingsRepositoryImpl(
      this._localDataSource, this._firestoreDataSource);

  @override
  Future<Either<Failure, TrainingSettings>> getTrainingSettings(
      DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _localDataSource.getTrainingSettings();
      case DataSource.local:
        return _firestoreDataSource.getTrainingSettings();
      default:
        throw ArgumentError();
    }
  }

  @override
  Future<Either<Failure, void>> saveTrainingSettings(
      TrainingSettings settings, DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _localDataSource.saveTrainingSettings(settings);
      case DataSource.local:
        return _firestoreDataSource.saveTrainingSettings(settings);
      default:
        throw ArgumentError();
    }
  }
}

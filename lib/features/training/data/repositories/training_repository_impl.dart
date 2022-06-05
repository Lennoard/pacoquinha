import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/datasources/training_data_source.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_repository.dart';

class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingDataSource _localDataSource;
  final TrainingDataSource _firestoreDataSource;

  TrainingRepositoryImpl(this._localDataSource, this._firestoreDataSource);

  @override
  Future<Either<Failure, void>> deleteTraining(
      Training training, DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _firestoreDataSource.deleteTraining(training);
      case DataSource.local:
        return _localDataSource.deleteTraining(training);
      default:
        throw ArgumentError();
    }
  }

  @override
  Future<Either<Failure, Training>> getTraining(
      dynamic id, DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _firestoreDataSource.getTraining(id);
      case DataSource.local:
        return _localDataSource.getTraining(id);
      default:
        throw ArgumentError();
    }
  }

  @override
  Future<Either<Failure, List<Training>>> getTrainings(
      DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _firestoreDataSource.getTrainings();
      case DataSource.local:
        return _localDataSource.getTrainings();
      default:
        throw ArgumentError();
    }
  }

  @override
  Future<Either<Failure, void>> insertTraining(
      Training training, DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _firestoreDataSource.insertTraining(training);
      case DataSource.local:
        return _localDataSource.insertTraining(training);
      default:
        throw ArgumentError();
    }
  }

  @override
  Future<Either<Failure, void>> updateTraining(
      Training training, DataSource source) async {
    switch (source) {
      case DataSource.firestore:
        return _firestoreDataSource.updateTraining(training);
      case DataSource.local:
        return _localDataSource.updateTraining(training);
      default:
        throw ArgumentError();
    }
  }
}

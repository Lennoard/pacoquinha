import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training.dart';

import '../entities/training_settings.dart';
import '../error/failures.dart';

abstract class TrainingRepository {
  Future<Either<Failure, BaseTraining>> getTraining(
      String id, DataSource source);

  Future<Either<Failure, void>> saveTraining(
      BaseTraining training, DataSource source);

  Future<Either<Failure, void>> deleteTraining(
      BaseTraining training, DataSource source);
}

import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training.dart';

import '../../../../common/data/failures.dart';

abstract class TrainingRepository {
  Future<Either<Failure, Training>> getTraining(dynamic id, DataSource source);

  Future<Either<Failure, List<Training>>> getTrainings(DataSource source);

  Future<Either<Failure, void>> insertTraining(
      Training training, DataSource source);

  Future<Either<Failure, void>> updateTraining(
      Training training, DataSource source);

  Future<Either<Failure, void>> deleteTraining(
      Training training, DataSource source);
}

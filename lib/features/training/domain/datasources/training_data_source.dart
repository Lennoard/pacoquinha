import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/common/data/failures.dart';

abstract class TrainingDataSource {
  Future<Either<Failure, Training>> getTraining(dynamic id);
  Future<Either<Failure, List<Training>>> getTrainings();
  Future<Either<Failure, void>> insertTraining(Training training);
  Future<Either<Failure, void>> updateTraining(Training training);
  Future<Either<Failure, void>> deleteTraining(Training training);
}

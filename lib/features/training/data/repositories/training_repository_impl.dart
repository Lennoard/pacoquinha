import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_repository.dart';


class TrainingRepositoryImpl implements TrainingRepository {

  @override
  Future<Either<Failure, void>> deleteTraining(BaseTraining training, DataSource source) {
    // TODO: implement deleteTraining
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BaseTraining>> getTraining(String id, DataSource source) {
    // TODO: implement getTraining
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveTraining(BaseTraining training, DataSource source) {
    // TODO: implement saveTraining
    throw UnimplementedError();
  }

}

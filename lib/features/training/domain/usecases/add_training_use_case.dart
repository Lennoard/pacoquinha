import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/common/data/failures.dart';

abstract class AddTrainingUseCase {
  Future<Either<Failure, void>> call(Training training);
}

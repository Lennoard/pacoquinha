import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/error/failures.dart';

abstract class GetTrainingUseCase {
  Future<Either<Failure, Training>> call(dynamic id);
}

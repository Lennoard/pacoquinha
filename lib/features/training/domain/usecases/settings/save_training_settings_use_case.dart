import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training/domain/error/failures.dart';

abstract class SaveTrainingSettingsUseCase {
  Future<Either<Failure, void>> call(TrainingSettings settings);
}

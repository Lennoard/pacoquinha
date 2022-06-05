import 'package:dartz/dartz.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
import 'package:tabata/common/data/failures.dart';

abstract class SaveTrainingSettingsUseCase {
  Future<Either<Failure, void>> call(TrainingSettings settings);
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_settings_repository.dart';

import '../get_training_settings_use_case.dart';

class GetTrainingSettingsUseCaseImpl implements GetTrainingSettingsUseCase {
  final FirebaseAuth _auth;
  final TrainingSettingsRepository _repository;

  GetTrainingSettingsUseCaseImpl(this._auth, this._repository);

  @override
  Future<Either<Failure, TrainingSettings>> call() async {
    var signedIn = _auth.currentUser != null;
    if (signedIn) {
      return _repository.getTrainingSettings(DataSource.firestore);
    }

    return _repository.getTrainingSettings(DataSource.local);
  }
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_settings_repository.dart';
import 'package:tabata/features/training/domain/usecases/settings/save_training_settings_use_case.dart';

class SaveTrainingSettingsUseCaseImpl implements SaveTrainingSettingsUseCase {
  final FirebaseAuth _auth;
  final TrainingSettingsRepository _repository;

  SaveTrainingSettingsUseCaseImpl(this._auth, this._repository);

  @override
  Future<Either<Failure, void>> call(TrainingSettings settings) async {
    var signedIn = _auth.currentUser != null;
    if (signedIn) {
      return _repository.saveTrainingSettings(settings, DataSource.firestore);
    }

    return _repository.saveTrainingSettings(settings, DataSource.local);
  }
}

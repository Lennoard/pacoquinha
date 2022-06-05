import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/common/data/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_repository.dart';
import 'package:tabata/features/training/domain/usecases/delete_training_use_case.dart';

class DeleteTrainingUseCaseImpl implements DeleteTrainingUseCase {
  final FirebaseAuth _auth;
  final TrainingRepository _repository;


  DeleteTrainingUseCaseImpl(this._auth, this._repository);

  @override
  Future<Either<Failure, void>> call(Training training) async {
    var signedIn = _auth.currentUser != null;
    if (signedIn) {
      return _repository.deleteTraining(training, DataSource.firestore);
    }

    return _repository.deleteTraining(training, DataSource.local);
  }
}

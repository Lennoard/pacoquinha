import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_repository.dart';
import 'package:tabata/features/training/domain/usecases/get_training_use_case.dart';

abstract class GetTrainingUseCaseImpl implements GetTrainingUseCase {
  final FirebaseAuth _auth;
  final TrainingRepository _repository;


  GetTrainingUseCaseImpl(this._auth, this._repository);

  @override
  Future<Either<Failure, Training>> call(dynamic id) async {
    var signedIn = _auth.currentUser != null;
    if (signedIn) {
      return _repository.getTraining(id, DataSource.firestore);
    }

    return _repository.getTraining(id, DataSource.local);
  }
}

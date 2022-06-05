import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabata/features/training/domain/datasources/data_sources.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:tabata/features/training/domain/repositories/training_repository.dart';
import 'package:tabata/features/training/domain/usecases/get_trainings_use_case.dart';

class GetTrainingsUseCaseImpl implements GetTrainingsUseCase {
  final FirebaseAuth _auth;
  final TrainingRepository _repository;


  GetTrainingsUseCaseImpl(this._auth, this._repository);

  @override
  Future<Either<Failure, List<Training>>> call() async {
    var signedIn = _auth.currentUser != null;
    if (signedIn) {
      return _repository.getTrainings(DataSource.firestore);
    }

    return _repository.getTrainings(DataSource.local);
  }
}

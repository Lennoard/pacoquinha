import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tabata/features/training/data/mappers/local_data_mapper.dart';
import 'package:tabata/features/training/data/mappers/training_mapper.dart';
import 'package:tabata/features/training/domain/datasources/training_data_source.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/training/domain/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrainingFirestoreDataSource implements TrainingDataSource {
  final FirebaseFirestore _db;
  final FirebaseAuth auth;
  final TrainingMapper _mapper;
  final LocalTrainingMapper _localMapper;

  TrainingFirestoreDataSource(
      this._db, this.auth, this._mapper, this._localMapper);

  @override
  Future<Either<Failure, void>> deleteTraining(Training training) async {
    try {
      return Right(await trainingsCollection.doc(id as String).delete());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Training>> getTraining(dynamic id) async {
    try {
      var docSnapshot = await trainingsCollection.doc(id as String).get();
      var data = docSnapshot.data() ?? {};
      return Right(_mapper.map(_localMapper.unmap(data)));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> insertTraining(Training training) async {
    try {
      var map = _localMapper.map(_mapper.unmap(training));
      await trainingsCollection.add(map);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Training>>> getTrainings() async {
    try {
      var snapshot = await trainingsCollection.get();
      List<Training> list = [];
      for (var docSnapshot in snapshot.docs) {
        var data = docSnapshot.data();
        list.add(_mapper.map(_localMapper.unmap(data)));
      }
      return Right(list);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTraining(Training training) async {
    try {
      var map = _localMapper.map(_mapper.unmap(training));
      await trainingsCollection.doc(training.id as String).set(map);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  String get _uid => auth.currentUser?.uid ?? "";

  CollectionReference<Map<String, dynamic>> get trainingsCollection => _db
      .collection('users')
      .doc(_uid)
      .collection('trainings');
}

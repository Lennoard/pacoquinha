import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabata/features/training/data/mappers/local_training_settings_mapper.dart';
import 'package:tabata/features/training/domain/datasources/training_settings_data_source.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training/domain/error/failures.dart';

class TrainingFirestoreDataSource implements TrainingSettingsDataSource {
  final FirebaseFirestore _db;
  final FirebaseAuth auth;
  final LocalTrainingSettingsMapper _mapper;

  TrainingFirestoreDataSource(this._db, this.auth, this._mapper);

  @override
  Future<Either<Failure, TrainingSettings>> getTrainingSettings() async {
    try {
      var docSnapshot = await settingsDoc.get();
      var data = docSnapshot.data() ?? {};
      return Right(_mapper.unmap(data));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveTrainingSettings(
      TrainingSettings settings) async {
    try {
      var map = _mapper.map(settings);
      await settingsDoc.set(map);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  String get _uid => auth.currentUser?.uid ?? "";

  DocumentReference<Map<String, dynamic>> get settingsDoc => _db
      .collection('users')
      .doc(_uid)
      .collection('trainingSetting')
      .doc('data');
}
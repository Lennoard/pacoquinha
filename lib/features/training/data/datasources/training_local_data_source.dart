import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tabata/common/data/database_helper.dart';
import 'package:tabata/features/training/data/mappers/local_data_mapper.dart';
import 'package:tabata/features/training/data/mappers/training_mapper.dart';
import 'package:tabata/features/training/domain/datasources/training_data_source.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/common/data/failures.dart';

class TrainingLocalDataSource implements TrainingDataSource {
  final DatabaseHelper _dbHelper;
  final TrainingMapper _mapper;
  final LocalTrainingMapper _localMapper;

  TrainingLocalDataSource(this._dbHelper, this._mapper, this._localMapper);

  @override
  Future<Either<Failure, void>> deleteTraining(Training training) async {
    var count = await (await _db).delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [training.id],
    );

    if (count == 0) {
      return Left(DatabaseFailure());
    }

    return const Right(null);
  }

  @override
  Future<Either<Failure, Training>> getTraining(dynamic id) async {
    var map =
        await (await _db).rawQuery('SELECT * FROM $_tableName WHERE ID = $id');

    if (map.isEmpty) {
      return Left(DatabaseFailure());
    }

    return Right(_mapper.map(_localMapper.unmap(map.first)));
  }

  @override
  Future<Either<Failure, List<Training>>> getTrainings() async {
    final List<Map<String, dynamic>> trainings =
        await (await _db).query(_tableName);

    var list = List.generate(trainings.length, (index) {
      var mappedTraining = _localMapper.unmap(trainings[index]);
      return _mapper.map(mappedTraining);
    });

    return Right(list);
  }

  @override
  Future<Either<Failure, void>> insertTraining(Training training) async {
    var id = await (await _db).insert(
      _tableName,
      _localMapper.map(_mapper.unmap(training)),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (id < 0) {
      return Left(DatabaseFailure());
    }

    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> updateTraining(Training training) async {
    var id = await (await _db).update(
      _tableName,
      _localMapper.map(_mapper.unmap(training)),
      where: 'id = ?',
      whereArgs: [training.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (id < 0) {
      return Left(DatabaseFailure());
    }

    return const Right(null);
  }

  Future<Database> get _db => _dbHelper.database;

  static const String _tableName = DatabaseHelper.trainingsTable;
}

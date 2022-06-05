import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tabata/features/training/data/database_helper.dart';
import 'package:tabata/features/training/data/mappers/local_training_settings_mapper.dart';
import 'package:tabata/features/training/domain/datasources/training_settings_data_source.dart';
import 'package:tabata/features/training/domain/entities/training_settings.dart';
import 'package:tabata/features/training/domain/error/failures.dart';

class TrainingSettingsLocalDataSource implements TrainingSettingsDataSource {
  final DatabaseHelper _dbHelper;
  final LocalTrainingSettingsMapper _mapper;

  TrainingSettingsLocalDataSource(this._dbHelper, this._mapper);

  @override
  Future<Either<Failure, TrainingSettings>> getTrainingSettings() async {
    var settingsMap = await (await _db).query(_tableName);

    if (settingsMap.isEmpty) {
      return Left(DatabaseFailure());
    }

    return Right(_mapper.unmap(settingsMap.first));
  }

  @override
  Future<Either<Failure, void>> saveTrainingSettings(TrainingSettings settings) async {
    var count = await (await _db).update(
      _tableName,
      _mapper.map(settings),
      where: null,
      whereArgs: null,
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    if (count == 0) {
      return Left(DatabaseFailure());
    }

    return const Right(null);
  }

  Future<Database> get _db  => _dbHelper.database;

  static const _tableName = DatabaseHelper.trainingsSettingsTable;

}

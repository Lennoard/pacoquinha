import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "Training.db";
  static const _databaseVersion = 1;

  static const trainingsTable = 'Trainings';
  static const trainingsSettingsTable = 'TrainingSettings';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $trainingsTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT NOT NULL,
        seriesTime INTEGER NOT NULL,
        seriesCount INTEGER NOT NULL,
        restingTime INTEGER NOT NULL,
        cycleCount INTEGER NOT NULL,
        cycleInterval INTEGER NOT NULL,
        intensity INTEGER NOT NULL
      )  
      ''');

    await db.execute('''
      CREATE TABLE $trainingsSettingsTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        seriesTime INTEGER NOT NULL,
        seriesCount INTEGER NOT NULL,
        restingTime INTEGER NOT NULL,
        cycleCount INTEGER NOT NULL,
        cycleInterval INTEGER NOT NULL
      )  
      ''');
  }
}

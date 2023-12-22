import 'package:hashitta/models/run_record.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'abstract_run_record_service.dart';

class RunRecordServiceDb implements AbstractRunRecordService {
  final String _tableName = 'run_records';
  Database? _database;
  RunRecordServiceDb() {
    initDatabase().then((db) {
      _database = db;
    });
  }

  Future<Database> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(join(await getDatabasesPath(), 'hashitta_database.db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE run_records(id TEXT PRIMARY KEY, runner TEXT, category TEXT, createdAt TEXT, duration INTEGER)',
      );
    }, version: 1);
  }

  Future<List<RunRecord>> getRunRecords() async {
    final Database? db = await _database;
    if (db == null) {
      throw Exception('Database is not initialized');
    }
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (index) {
      return RunRecord.fromJson(maps[index]);
    });
  }

  Future<RunRecord> insertRunRecord(RunRecord record) async {
    final Database? db = await _database;
    if (db == null) {
      throw Exception('Database is not initialized');
    }
    var id = Uuid().v1().toString();
    record.id = id;
    await db.insert(
      _tableName,
      record.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return record;
  }

  Future<bool> deleteRunRecord(String? id) async {
    final Database? db = await _database;
    if (db == null) {
      throw Exception('Database is not initialized');
    }
    if (await db.delete(
          _tableName,
          where: "id = ?",
          whereArgs: [id],
        ) ==
        0) {
      return false;
    }
    return true;
  }
}

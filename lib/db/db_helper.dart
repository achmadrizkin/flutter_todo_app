import 'package:flutter_todo_app/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "task";

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + "task.db";
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print("Creating a new one");

        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title STRING, note TEXT, date STRING, "
          "startTime STRING, endTime STRING, "
          "remind INTEGER, repeat STRING, "
          "color INTEGER, "
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }
}

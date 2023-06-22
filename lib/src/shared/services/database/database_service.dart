import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../../../database/database_manager.dart';

class DatabaseService {
  DatabaseManager database = Modular.get();

  Future<int> upInsertDB(
    Map<String, Object?> item,
    String table,
  ) async {
    var db = await database.database.future;

    return await db.insert(
      table.toString(),
      item,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteDB(String id, String table) async {
    final db = await database.database.future;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map>> queryDB(String table) async {
    var db = await database.database.future;
    return db.query(table);
  }
}

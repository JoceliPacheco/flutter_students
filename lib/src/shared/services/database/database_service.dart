import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../../../database/database_manager.dart';

class DatabaseService {
  DatabaseManager database = Modular.get();

  Future<int> upInsert(
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

  Future<int> delete(String id, String table) async {
    final db = await database.database.future;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map>> list(String table) async {
    var db = await database.database.future;
    return db.query(table);
  }
}

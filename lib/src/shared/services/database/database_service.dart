import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../../../database/database_manager.dart';

class DatabaseService {
  DatabaseManager database = Modular.get();

  Future<int> create(
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
}

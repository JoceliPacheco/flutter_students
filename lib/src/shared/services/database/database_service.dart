import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/query_builder.dart';
import 'package:sqflite/sqflite.dart';

import '../../../database/database_manager.dart';
import '../../models/where_args.dart';

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

  Future<List<Map>> queryDB(String table, QueryBuilder query) async {
    String whereArgs = _resolveWhere(query);

    String sql = '''
        SELECT *
          FROM $table
        WHERE 1=1 AND $whereArgs
        ORDER BY ${query.orderBy}
    ''';

    var db = await database.database.future;
    return db.rawQuery(sql);
  }

  String _resolveWhere(QueryBuilder query) {
    String whereBase = '';

    for (var column in query.fields) {
      whereBase += " $column LIKE '%${query.termo}%' OR";
    }

    if (whereBase.isNotEmpty) {
      whereBase = whereBase.substring(0, whereBase.length - 2);
    }

    return whereBase;
  }
}

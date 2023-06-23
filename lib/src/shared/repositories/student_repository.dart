import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/models/query_builder.dart';
import 'package:flutter_students/src/shared/services/database/database_service.dart';

class StudentRepository {
  DatabaseService databaseService = Modular.get();

  String tableName = 'aluno';

  Future<bool> upInsert(Student student) async {
    if (student.id!.isEmpty) {
      student.id = handleId;
    }

    int result = await databaseService.upInsertDB(
      student.toJson(),
      tableName,
    );

    return result > 0;
  }

  Future<bool> delete(String id) async {
    int result = await databaseService.deleteDB(id, tableName);

    return result > 0;
  }

  Future<List<Student>> list(QueryBuilder query) async {
    return databaseService
        .queryDB(
          tableName,
          query,
        )
        .then(Student.fromList)
        .catchError((e) {
      return throw Exception('Erro');
    });
  }

  String get handleId => DateTime.now().microsecondsSinceEpoch.toString();
}

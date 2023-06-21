import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/services/database/database_service.dart';

class StudentRepository {
  DatabaseService databaseService = Modular.get();

  String tableName = 'aluno';

  Future<bool> create(Student student) async {
    int result = await databaseService.create(
      student.toJson(),
      tableName,
    );

    return result > 0;
  }

  Future<bool> delete(String id) async {
    int result = await databaseService.delete(id, tableName);

    return result > 0;
  }

  Future<List<Student>> list() async {
    return databaseService.list(tableName).then(Student.fromList);
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/services/database/database_service.dart';

class StudentRepository {
  DatabaseService databaseService = Modular.get();

  Future<bool> create(Student student) async {
    int result = await databaseService.create(
      student.toJson(),
      'aluno',
    );

    return result > 0;
  }
}

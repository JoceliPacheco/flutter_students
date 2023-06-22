import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/models/register_student.dart';
import 'package:flutter_students/src/shared/repositories/student_repository.dart';
import 'package:flutter_students/src/shared/transformers/register_student_to_studant.dart';

class UpInsertStudentService {
  final StudentRepository repository = Modular.get();

  handle(RegisterStudent data) async {
    Student student = RegisterStudentToStudant.transform(data);

    return await repository.upInsert(student);
  }
}

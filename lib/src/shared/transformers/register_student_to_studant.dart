import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/models/register_student.dart';

class RegisterStudentToStudant {
  static Student transform(RegisterStudent data) {
    return Student(
      id: data.id,
      name: data.name ?? '',
      email: data.email ?? '',
      active: data.active ?? true,
      password: data.password ?? '',
      phone: data.phone,
      observation: data.observation,
      value: data.value,
    );
  }
}

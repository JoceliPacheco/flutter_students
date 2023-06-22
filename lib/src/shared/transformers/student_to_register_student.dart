import '../models/domain/student.dart';
import '../models/register_student.dart';

class StudentToRegisterStudent {
  static RegisterStudent transform(Student data) {
    return RegisterStudent(
      id: data.id,
      name: data.name,
      email: data.email,
      active: data.active,
      password: data.password,
      phone: data.phone,
      observation: data.observation,
    );
  }
}

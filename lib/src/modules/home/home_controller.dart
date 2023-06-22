import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/repositories/student_repository.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/register_student.dart';
import '../../shared/services/fetch_store/fetch_store.dart';
import '../../shared/transformers/student_to_register_student.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final StudentRepository repository = Modular.get();

  @observable
  List<Student> list = [];

  @observable
  bool isFetching = false;

  FetchStore<List<Student>> students = FetchStore([]);

  init() {
    fetchStudents();
  }

  fetchStudents() async {
    students.fetch(repository.list());
  }

  Future<void> onRefresh() async {
    fetchStudents();
  }

  void goRegister() {
    Modular.to.pushNamed(
      '/register',
      arguments: {
        'data': RegisterStudent(),
      },
    ).then(
      (value) => fetchStudents(),
    );
  }

  void goEditRegister(Student student) {
    Modular.to.pushNamed(
      '/register',
      arguments: {
        'data': StudentToRegisterStudent.transform(student),
      },
    ).then(
      (value) => fetchStudents(),
    );
  }
}

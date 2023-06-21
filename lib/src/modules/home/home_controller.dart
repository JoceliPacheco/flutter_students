import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/repositories/student_repository.dart';
import 'package:mobx/mobx.dart';

import '../../shared/components/fetch_list/fetch_store.dart';
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
    print('onRefresh');
    fetchStudents();
  }
}

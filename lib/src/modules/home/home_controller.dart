import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/repositories/student_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final StudentRepository repository = Modular.get();

  @observable
  List<Student> list = [];

  init() {
    /*    
      repository.upInsert(
        Student(
            id: '2',
            name: 'joceli',
            email: 'email',
            password: 'password',
            active: true,
            phone: 'phone',
            value: 2.55,
            observation: 'observation'),
      ); 
    */

    fetchStudents();
  }

  fetchStudents() async {
    list = await repository.list();
  }
}

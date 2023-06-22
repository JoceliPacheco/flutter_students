import 'package:flutter_students/src/shared/models/register_student.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  @observable
  RegisterStudent data = RegisterStudent();

  @action
  setData(RegisterStudent newdata) {
    data = newdata;
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/helpers/transformers.dart';
import 'package:flutter_students/src/shared/models/register_student.dart';
import 'package:mobx/mobx.dart';

import '../../shared/services/student/up_insert_student_service.dart';
part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UpInsertStudentService upInsertStudentService = Modular.get();

  @observable
  RegisterStudent data = RegisterStudent();

  @action
  setData(RegisterStudent newData) {
    data = newData;
  }

  @action
  setName(dynamic value) {
    data.name = value;
  }

  @action
  setEmail(dynamic value) {
    data.email = value;
  }

  @action
  setPassword(dynamic value) {
    data.password = value;
  }

  @action
  setPhone(dynamic value) {
    data.phone = value;
  }

  @action
  setValue(dynamic value) {
    data.value = currencyToDouble(value);
  }

  @action
  setObs(dynamic value) {
    data.observation = value;
  }

  register() async {
    await upInsertStudentService.handle(data);
    Modular.to.popUntil((p0) => false);
  }
}

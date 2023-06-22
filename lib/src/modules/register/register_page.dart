import 'package:flutter/material.dart';
import 'package:flutter_students/src/modules/register/steps/name_step_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NameStepRegister();
  }
}

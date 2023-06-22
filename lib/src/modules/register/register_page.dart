import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/steps/name_step.dart';
import 'package:flutter_students/src/modules/register/style/input_register_style.dart';

import 'form/form_page_register.dart';
import 'steps/step_register.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NameStep();
  }
}

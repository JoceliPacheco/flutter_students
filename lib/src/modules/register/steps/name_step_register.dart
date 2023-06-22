import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class NameStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  NameStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Cancelar',
      nextLabel: 'Avançar',
      onSuccess: () => Modular.to.pushNamed('/register/email'),
      child: InputTextRegister(
        label: 'Nome',
        onChange: (v) => controller.setName(v),
      ),
    );
  }
}

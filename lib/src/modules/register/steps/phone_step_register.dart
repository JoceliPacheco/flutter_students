import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class PhoneStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  PhoneStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Voltar',
      nextLabel: 'Avançar',
      onSuccess: () => Modular.to.pushNamed('/register/value'),
      child: InputTextRegister(
        label: 'Telefone',
        onChange: (v) => controller.setPhone(v),
      ),
    );
  }
}

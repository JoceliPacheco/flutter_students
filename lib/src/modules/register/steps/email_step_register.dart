import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../form/form_page_register.dart';
import '../form/input_text_register.dart';
import '../register_controller.dart';

class EmailStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  EmailStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Voltar',
      nextLabel: 'Avançar',
      onSuccess: () => Modular.to.pushNamed('/register/password'),
      child: InputTextRegister(
        label: 'E-mail',
        onChange: (v) => controller.setEmail(v),
      ),
    );
  }
}

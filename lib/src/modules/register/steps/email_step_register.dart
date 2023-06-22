import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../form/form_page_register.dart';
import '../form/input_text_register.dart';

class EmailStepRegister extends StatelessWidget {
  const EmailStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Voltar',
      nextLabel: 'Avançar',
      onSuccess: () => Modular.to.pushNamed('/register/password'),
      child: const InputTextRegister(
        label: 'E-mail',
      ),
    );
  }
}

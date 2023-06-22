import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';

import '../form/form_page_register.dart';

class ObsStepRegister extends StatelessWidget {
  const ObsStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Voltar',
      nextLabel: 'Finalizar',
      onSuccess: () => Modular.to.pushNamedAndRemoveUntil('/', (p0) => false),
      child: const InputTextRegister(
        label: 'Observação',
      ),
    );
  }
}

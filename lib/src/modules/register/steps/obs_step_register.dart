import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class ObsStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  ObsStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Voltar',
      nextLabel: 'Finalizar',
      onSuccess: () => controller.register(),
      child: InputTextRegister(
        label: 'Observação',
        onChange: (v) => controller.setObs(v),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class ValueStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  ValueStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      backLabel: 'Voltar',
      nextLabel: 'Avançar',
      onSuccess: () => Modular.to.pushNamed('/register/obs'),
      child: InputTextRegister(
        label: 'Valor mensalidade',
        onChange: (v) => controller.setValue(v),
      ),
    );
  }
}

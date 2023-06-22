import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class ValueStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  ValueStepRegister({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSuccess() {
    Modular.to.pushNamed('/register/obs');
  }

  void validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      onSuccess();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      formKey: formKey,
      validateAndSave: validateAndSave,
      backLabel: 'Voltar',
      nextLabel: 'Avançar',
      onSuccess: validateAndSave,
      child: InputTextRegister(
        label: 'Valor mensalidade',
        value: controller.data.value.toString(),
        onChange: (v) => controller.setValue(v),
        onSubmit: (v) => validateAndSave(),
      ),
    );
  }
}

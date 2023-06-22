import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class PhoneStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  PhoneStepRegister({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSuccess() {
    Modular.to.pushNamed('/register/value');
  }

  void validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      onSuccess();
    } else {}
  }

  final maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      formKey: formKey,
      validateAndSave: validateAndSave,
      backLabel: 'Voltar',
      nextLabel: 'Avançar',
      onSuccess: validateAndSave,
      child: InputTextRegister(
        label: 'Telefone',
        value: controller.data.phone,
        onChange: (v) => controller.setPhone(v),
        onSubmit: (v) => validateAndSave(),
        inputFormatters: [maskFormatter],
      ),
    );
  }
}

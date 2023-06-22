import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class ObsStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  ObsStepRegister({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSuccess() {
    controller.register();
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
      nextLabel: 'Finalizar',
      onSuccess: validateAndSave,
      child: InputTextRegister(
        label: 'Observação',
        value: controller.data.observation,
        onChange: (v) => controller.setObs(v),
        onSubmit: (v) => validateAndSave(),
        validators: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Obrigatório'),
          FormBuilderValidators.minLength(5, errorText: 'Mínimo 5 caracteres'),
        ]),
      ),
    );
  }
}

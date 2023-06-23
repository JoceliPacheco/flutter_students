import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../form/form_page_register.dart';
import '../register_controller.dart';

class PasswordStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  PasswordStepRegister({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSuccess() {
    Modular.to.pushNamed('/register/phone');
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
      backLabel: AppLocalizations.of(context)!.back,
      nextLabel: AppLocalizations.of(context)!.next,
      onSuccess: validateAndSave,
      child: InputTextRegister(
        secret: true,
        label: AppLocalizations.of(context)!.pass,
        value: controller.data.password,
        onChange: (v) => controller.setPassword(v),
        onSubmit: (v) => validateAndSave(),
        validators: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: AppLocalizations.of(context)!.required),
          FormBuilderValidators.minLength(6,
              errorText: '${AppLocalizations.of(context)!.minLength} | 6'),
        ]),
      ),
    );
  }
}

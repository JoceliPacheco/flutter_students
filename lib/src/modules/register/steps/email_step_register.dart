import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../form/form_page_register.dart';
import '../form/input_text_register.dart';
import '../register_controller.dart';

class EmailStepRegister extends StatelessWidget {
  final RegisterController controller = Modular.get();

  EmailStepRegister({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSuccess() {
    Modular.to.pushNamed('/register/password');
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
        label: AppLocalizations.of(context)!.email,
        value: controller.data.email,
        onChange: (v) => controller.setEmail(v),
        onSubmit: (v) => validateAndSave(),
        validators: FormBuilderValidators.compose([
          FormBuilderValidators.required(
              errorText: AppLocalizations.of(context)!.required),
          FormBuilderValidators.email(
              errorText:
                  '${AppLocalizations.of(context)!.email} ${AppLocalizations.of(context)!.invalid}'),
        ]),
      ),
    );
  }
}

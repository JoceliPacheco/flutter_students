import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/form/input_text_register.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      backLabel: AppLocalizations.of(context)!.back,
      nextLabel: AppLocalizations.of(context)!.next,
      onSuccess: validateAndSave,
      child: InputTextRegister(
        label: AppLocalizations.of(context)!.value,
        value: controller.data.value.toString(),
        onChange: (v) => controller.setValue(v),
        onSubmit: (v) => validateAndSave(),
        controller: MoneyMaskedTextController(leftSymbol: 'R\$ '),
        validators: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: AppLocalizations.of(context)!.required,
          ),
          FormBuilderValidators.notEqual(
            'R\$ 0,00',
            errorText: AppLocalizations.of(context)!.required,
          ),
        ]),
      ),
    );
  }
}

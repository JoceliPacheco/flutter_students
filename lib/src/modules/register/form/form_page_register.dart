import 'package:flutter/material.dart';
import 'package:flutter_students/src/modules/register/steps/step_register.dart';

import '../style/input_register_style.dart';

class FormPageRegister extends StatelessWidget {
  final Widget child;
  final Function onSuccess;
  FormPageRegister({
    required this.child,
    required this.onSuccess,
    super.key,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAndSave(Function? onSuccess) {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      onSuccess!();
    } else {
      print('Invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: StepRegister(
        onSuccess: () => validateAndSave(this.onSuccess),
        child: child,
      ),
    );
  }
}

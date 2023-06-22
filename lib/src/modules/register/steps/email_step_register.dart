import 'package:flutter/material.dart';

import '../form/form_page_register.dart';
import '../style/input_register_style.dart';

class EmailStepRegister extends StatelessWidget {
  const EmailStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      onSuccess: () => print('Tudo certo!'),
      child: TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: inputRegisterStyle('E*mail'),
        validator: (String? value) =>
            value!.isEmpty ? 'Email cannot be blank' : null,
        // onSaved: (value) => _email = value,
      ),
    );
  }
}

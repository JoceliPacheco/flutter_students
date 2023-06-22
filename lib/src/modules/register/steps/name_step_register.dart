import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../form/form_page_register.dart';
import '../style/input_register_style.dart';

class NameStepRegister extends StatelessWidget {
  const NameStepRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return FormPageRegister(
      onSuccess: () => Modular.to.pushNamed('/register/email'),
      child: TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: inputRegisterStyle('Nome'),
        validator: (String? value) =>
            value!.isEmpty ? 'Nome cannot be blank' : null,
        // onSaved: (value) => _email = value,
      ),
    );
  }
}
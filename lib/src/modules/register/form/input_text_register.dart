import 'package:flutter/material.dart';

import '../style/input_register_style.dart';

class InputTextRegister extends StatelessWidget {
  final String label;
  final bool secret;
  const InputTextRegister({
    required this.label,
    this.secret = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: secret,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: inputRegisterStyle(label),
      validator: (String? value) => value!.isEmpty ? '$label required' : null,
    );
  }
}

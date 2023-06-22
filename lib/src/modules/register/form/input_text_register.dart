import 'package:flutter/material.dart';

import '../style/input_register_style.dart';

class InputTextRegister extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final String label;
  final bool secret;
  final Function? onChange;
  InputTextRegister({
    required this.label,
    this.onChange,
    this.secret = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: (value) {
        onChange!(value);
      },
      autofocus: true,
      obscureText: secret,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: inputRegisterStyle(label),
      validator: (String? value) => value!.isEmpty ? '$label required' : null,
    );
  }
}

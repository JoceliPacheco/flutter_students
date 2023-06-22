import 'package:flutter/material.dart';

import '../style/input_register_style.dart';

class InputTextRegister extends StatefulWidget {
  final String label;
  final bool secret;
  final Function? onChange;
  final Function? onSubmit;
  final String? value;
  const InputTextRegister({
    required this.label,
    this.value = '',
    this.onChange,
    this.onSubmit,
    this.secret = false,
    super.key,
  });

  @override
  State<InputTextRegister> createState() => _InputTextRegisterState();
}

class _InputTextRegisterState extends State<InputTextRegister> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: textEditingController,
      onChanged: (value) {
        widget.onChange!(value);
      },
      onFieldSubmitted: (value) {
        widget.onSubmit!(value);
      },
      autofocus: true,
      obscureText: widget.secret,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white, fontSize: 24),
      decoration: inputRegisterStyle(widget.label),
      validator: (String? value) =>
          value!.isEmpty ? '${widget.label} required' : null,
    );
  }
}

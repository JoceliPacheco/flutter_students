import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/input_register_style.dart';

class InputTextRegister extends StatefulWidget {
  final String label;
  final bool secret;
  final Function? onChange;
  final Function? onSubmit;
  final String? value;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validators;
  const InputTextRegister({
    required this.label,
    this.value = '',
    this.onChange,
    this.onSubmit,
    this.secret = false,
    this.inputFormatters = const [],
    this.controller,
    this.validators,
    super.key,
  });

  @override
  State<InputTextRegister> createState() => _InputTextRegisterState();
}

class _InputTextRegisterState extends State<InputTextRegister> {
  late TextEditingController controller =
      widget.controller ?? TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = widget.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      textInputAction: TextInputAction.next,
      controller: controller,
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
      validator: widget.validators,
    );
  }
}

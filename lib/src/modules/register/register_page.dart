import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/register_controller.dart';
import 'package:flutter_students/src/modules/register/steps/name_step_register.dart';
import 'package:flutter_students/src/shared/models/register_student.dart';

class RegisterPage extends StatefulWidget {
  final RegisterStudent? data;

  const RegisterPage({
    this.data,
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.setData(widget.data ?? RegisterStudent());
  }

  @override
  Widget build(BuildContext context) {
    return NameStepRegister();
  }
}

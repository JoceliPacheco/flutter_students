import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/steps/email_step_register.dart';
import 'package:flutter_students/src/modules/register/steps/obs_step_register.dart';
import 'package:flutter_students/src/modules/register/steps/password_step_register.dart';
import 'package:flutter_students/src/modules/register/steps/phone_step_register.dart';
import 'package:flutter_students/src/modules/register/steps/value_step_register.dart';
import 'package:flutter_students/src/shared/services/student/up_insert_student_service.dart';

import '../../shared/repositories/student_repository.dart';
import '../../shared/services/database/database_service.dart';

import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => DatabaseService()),
        Bind((i) => UpInsertStudentService()),
        Bind((i) => StudentRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => RegisterPage(
            data: args.data!['data'],
          ),
        ),
        ChildRoute(
          '/email',
          child: (context, args) => EmailStepRegister(),
        ),
        ChildRoute(
          '/password',
          child: (context, args) => PasswordStepRegister(),
        ),
        ChildRoute(
          '/phone',
          child: (context, args) => PhoneStepRegister(),
        ),
        ChildRoute(
          '/value',
          child: (context, args) => ValueStepRegister(),
        ),
        ChildRoute(
          '/obs',
          child: (context, args) => ObsStepRegister(),
        ),
      ];
}

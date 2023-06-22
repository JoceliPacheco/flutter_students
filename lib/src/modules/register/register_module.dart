import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/modules/register/steps/email_step.dart';

import '../../shared/repositories/student_repository.dart';
import '../../shared/services/database/database_service.dart';

import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends Module {
  final TransitionType transitionType = TransitionType.rightToLeftWithFade;

  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => DatabaseService()),
        Bind((i) => StudentRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => RegisterPage()),
        ChildRoute(
          '/email',
          child: (context, args) => EmailStep(),
          transition: transitionType,
        ),
      ];
}

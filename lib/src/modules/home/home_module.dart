import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/student_repository.dart';
import '../../shared/services/database/database_service.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => DatabaseService()),
        Bind((i) => StudentRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}

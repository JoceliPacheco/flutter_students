import 'package:flutter_modular/flutter_modular.dart';

import '../database/database_manager.dart';
import '../modules/home/home_module.dart';
import '../modules/register/register_module.dart';

import 'app_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Core
        Bind((i) => AppController()),
        Bind((i) => DatabaseManager()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/register', module: RegisterModule()),
      ];
}

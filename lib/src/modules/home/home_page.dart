import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/core/app_controller.dart';
import 'package:flutter_students/src/modules/home/home_controller.dart';
import 'package:flutter_students/src/shared/components/student/card_student.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/components/alerts/confirm_alert.dart';
import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/fetch_list/fetch_list.dart';
import '../../shared/components/layout/layout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppController appController = Modular.get();

  final HomeController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
        title: ' ',
        actions: [
          ButtonLanguage('pt', onClick: appController.setLang),
          ButtonLanguage('en', onClick: appController.setLang),
          ButtonLanguage('es', onClick: appController.setLang),
        ],
        body: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          color: Theme.of(context).primaryColor,
          child: FetchList<Student>(
            itemBuilder: (student) => CardStudent(
              student,
              onTap: controller.goEditRegister,
              onDelete: (v) => confirmaAlert(
                context,
                onOk: () => controller.onDelete(student),
                msg: 'Deseja realmente deletar este cadastro!',
              ),
              handleActive: controller.handleActive,
            ),
            fetchStore: controller.students,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.goRegister(),
          child: const Icon(
            FontAwesomeIcons.userPlus,
          ),
        ));
  }
}

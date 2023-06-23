import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/core/app_controller.dart';
import 'package:flutter_students/src/modules/home/home_controller.dart';
import 'package:flutter_students/src/shared/components/student/card_student.dart';
import 'package:flutter_students/src/shared/components/templates/simple_content_container.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/components/alerts/confirm_alert.dart';
import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/app_bar/search_in_app_bar.dart';
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
      title: '',
      actions: [
        ButtonLanguage('pt', onClick: appController.setLang),
        ButtonLanguage('en', onClick: appController.setLang),
        ButtonLanguage('es', onClick: appController.setLang),
        const IconOrder(),
      ],
      body: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        color: Theme.of(context).primaryColor,
        child: SimpleContentContainer(
          child: FetchList<Student>(
            itemBuilder: (student) => CardStudent(
              student,
              onTap: controller.goEditRegister,
              onDelete: (v) => confirmaAlert(
                context,
                onOk: () => controller.onDelete(student),
                msg: AppLocalizations.of(context)!.confirmDelete,
              ),
              handleActive: controller.handleActive,
            ),
            fetchStore: controller.students,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goRegister(),
        child: const Icon(
          FontAwesomeIcons.userPlus,
        ),
      ),
      child: SearchInAppBar(
        onSearch: controller.onSearch,
      ),
    );
  }
}

class IconOrder extends StatefulWidget {
  const IconOrder({super.key});

  @override
  State<IconOrder> createState() => _IconOrderState();
}

class _IconOrderState extends State<IconOrder> {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.students.data.isEmpty) {
          return Container();
        }

        return IconButton(
          onPressed: () {
            setState(() {
              controller.onOrder();
            });
          },
          icon: Icon(
            controller.iconOrder,
            color: Colors.blueGrey[800],
          ),
        );
      },
    );
  }
}

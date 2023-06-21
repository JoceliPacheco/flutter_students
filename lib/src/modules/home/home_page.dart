import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/core/app_controller.dart';
import 'package:flutter_students/src/modules/home/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/layout/layout_page.dart';
import '../../shared/style/texts/text_center.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

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
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.lang,
            style: textCenter,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(
            FontAwesomeIcons.userPlus,
          ),
        ));
  }
}

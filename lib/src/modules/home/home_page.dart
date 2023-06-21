import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/core/app_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/layout/layout_page.dart';
import '../../shared/style/texts/text_center.dart';

class HomePage extends StatelessWidget {
  final AppController appController = Modular.get();
  HomePage({super.key});

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
          backgroundColor: Colors.blueGrey[800],
          child: Icon(
            FontAwesomeIcons.userPlus,
            color: Colors.blueGrey[200],
          ),
        ));
  }
}

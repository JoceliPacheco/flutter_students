import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

confirmaAlert(
  BuildContext context, {
  Function? onOk,
  String? msg,
}) {
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Ação necessária",
      style: TextStyle(
        color: Colors.blueGrey,
      ),
    ),
    content: Text("$msg"),
    actions: [
      TextButton(
        child: Text(
          AppLocalizations.of(context)!.cancel,
          style: const TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        onPressed: () => Modular.to.pop(),
      ),
      TextButton(
        child: Text(
          AppLocalizations.of(context)!.yes,
          style: const TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        onPressed: () => {
          Modular.to.pop(),
          onOk!(),
        },
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

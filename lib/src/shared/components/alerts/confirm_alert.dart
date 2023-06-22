import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        child: const Text(
          "Cancelar",
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        onPressed: () => Modular.to.pop(),
      ),
      TextButton(
        child: const Text(
          "Sim",
          style: TextStyle(
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

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonLanguage extends StatelessWidget {
  final String language;
  final Function? onClick;

  const ButtonLanguage(
    this.language, {
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String localeName = AppLocalizations.of(context)!.localeName;
    return TextButton(
      onPressed: () => onClick!(language),
      child: Text(
        language.toUpperCase(),
        style: TextStyle(
          color: localeName == language ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}

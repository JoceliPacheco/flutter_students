import 'package:flutter/material.dart';

import '../../../shared/components/layout/layout_page.dart';

class FormPageRegister extends StatelessWidget {
  final Widget child;
  final Function onSuccess;
  final String backLabel;
  final String nextLabel;
  final GlobalKey<FormState> formKey;
  final Function validateAndSave;
  const FormPageRegister({
    required this.formKey,
    required this.child,
    required this.validateAndSave,
    required this.onSuccess,
    required this.backLabel,
    required this.nextLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: LayoutPage(
        title: backLabel,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: child,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => validateAndSave(),
          label: Text(nextLabel),
        ),
      ),
    );
  }
}

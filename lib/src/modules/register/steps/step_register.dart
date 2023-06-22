import 'package:flutter/material.dart';
import 'package:flutter_students/src/shared/components/layout/layout_page.dart';

import '../style/input_register_style.dart';

class StepRegister extends StatelessWidget {
  final Function? onSuccess;
  final Widget child;
  const StepRegister({
    required this.onSuccess,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      title: 'Cancelar',
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: this.child,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => onSuccess!(),
        label: Text('Avançar'),
      ),
    );
  }
}

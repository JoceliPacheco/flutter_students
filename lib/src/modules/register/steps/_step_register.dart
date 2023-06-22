import 'package:flutter/material.dart';
import 'package:flutter_students/src/shared/components/layout/layout_page.dart';

class StepRegister extends StatelessWidget {
  final Function onSuccess;
  final Widget child;
  const StepRegister({super.key, 
    required this.onSuccess,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      title: 'Cancelar',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: child,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => onSuccess(),
        label: const Text('Avançar'),
      ),
    );
  }
}

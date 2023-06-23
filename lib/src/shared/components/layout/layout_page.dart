import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? child;

  const LayoutPage({
    required this.title,
    required this.body,
    this.child,
    this.actions = const [],
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: child ?? Text(title),
        actions: actions,
      ),
      body: body,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
    );
  }
}

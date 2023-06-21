import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;

  const LayoutPage({
    required this.title,
    required this.body,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}

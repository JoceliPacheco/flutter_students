import 'package:flutter/material.dart';

class SimpleContentContainer<T> extends StatelessWidget {
  final Widget? head;
  final Widget? child;
  final Widget? bottom;

  const SimpleContentContainer({
    this.head,
    this.bottom,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHead(),
        _buildBody(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildHead() {
    return head ?? Container();
  }

  Widget _buildBody() {
    return Expanded(child: child ?? Container());
  }

  Widget _buildBottom() {
    return bottom ?? Container();
  }
}

import 'package:flutter/material.dart';

class SimpleInfoWidget extends StatelessWidget {
  final Widget? child;

  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Color? titleFontColor;

  final String? value;
  final double? valueFontSize;
  final FontWeight? valueFontWeight;
  final Color? valueFontColor;

  const SimpleInfoWidget({super.key, 
    this.title,
    this.value,
    this.child,
    this.titleFontSize = 12,
    this.valueFontSize = 12,
    this.titleFontWeight = FontWeight.bold,
    this.valueFontWeight = FontWeight.normal,
    this.titleFontColor,
    this.valueFontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title.toString(),
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: titleFontWeight,
            color: titleFontColor,
          ),
        ),
        child ??
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: valueFontSize,
                fontWeight: valueFontWeight,
                color: valueFontColor,
              ),
            ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';

class CardStudent extends StatelessWidget {
  final Student student;
  const CardStudent({
    required this.student,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(student.name),
      ),
    );
  }
}

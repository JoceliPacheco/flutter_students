import 'package:flutter/material.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';

class CardStudent extends StatelessWidget {
  final Student student;
  final Function? onTap;
  const CardStudent(
    this.student, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTap!(student),
        title: Text(student.name),
      ),
    );
  }
}

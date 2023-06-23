import 'package:flutter/material.dart';
import 'package:flutter_students/src/helpers/transformers.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../templates/simple_info_widget.dart';

class CardStudent extends StatefulWidget {
  final Student student;
  final Function? onTap;
  final Function? onDelete;
  final Function? handleActive;

  const CardStudent(
    this.student, {
    this.onTap,
    this.onDelete,
    this.handleActive,
    super.key,
  });

  @override
  State<CardStudent> createState() => _CardStudentState();
}

class _CardStudentState extends State<CardStudent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap!(widget.student),
      child: Card(
        color: widget.student.active ? Colors.white : Colors.grey,
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.student.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.student.email),
              trailing: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    widget.handleActive!(widget.student);
                  });
                },
                icon: Icon(
                  widget.student.active
                      ? FontAwesomeIcons.toggleOn
                      : FontAwesomeIcons.toggleOff,
                ),
              ),
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SimpleInfoWidget(
                      title: AppLocalizations.of(context)!.phone,
                      value: widget.student.phone,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SimpleInfoWidget(
                      title: AppLocalizations.of(context)!.value,
                      value: formatCurrency(widget.student.value ?? 0),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              title: SimpleInfoWidget(
                title: AppLocalizations.of(context)!.obs,
                value: widget.student.observation.toString(),
              ),
              trailing: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => widget.onDelete!(widget.student),
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

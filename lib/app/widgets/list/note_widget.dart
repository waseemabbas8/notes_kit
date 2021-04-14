import 'package:flutter/material.dart';
import 'package:notes_kit/app/utils/constants.dart';
import 'package:notes_kit/app/utils/styles.dart';
import 'package:notes_kit/domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final Color _backgroundColor;
  final Note _note;

  NoteWidget(this._backgroundColor, this._note);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 10, left: 16, right: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(kCardRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_note.title, style: noteTitleStyle),
            SizedBox(height: 10),
            Text(
              _note.description,
              style: bodyTextStyle.copyWith(color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              _note.date,
              style: dateTextStyle,
            ),
          ],
        ),
      );
}

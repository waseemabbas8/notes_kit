import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_kit/app/pages/home/home_controller.dart';
import 'package:notes_kit/app/utils/colors.dart';
import 'package:notes_kit/app/widgets/list/note_widget.dart';

class NotesPage extends StatelessWidget {
  final notesColors = [
    kPrimaryLight,
    kYellowLight,
    kPinkLight,
    Color(0xFFF3F5F7),
  ];

  @override
  Widget build(BuildContext context) {
    var colorIndex = -1;
    HomeController controller =
        FlutterCleanArchitecture.getController<HomeController>(context);
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: controller.notes.length,
        itemBuilder: (BuildContext context, int index) {
          if (colorIndex >= 3) {
            colorIndex = 0;
          } else {
            colorIndex++;
          }
          return NoteWidget(notesColors[colorIndex], controller.notes[index]);
        },
      ),
    );
  }
}

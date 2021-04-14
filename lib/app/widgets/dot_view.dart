import 'package:flutter/cupertino.dart';
import 'package:notes_kit/app/utils/colors.dart';

class DotView extends StatelessWidget {
  final bool isSelected;

  DotView(this.isSelected);

  @override
  Widget build(BuildContext context) {
    Color fillColor;
    if (isSelected) {
      fillColor = kPrimaryColor;
    } else {
      fillColor = kPrimaryLight;
    }
    return Container(
      width: 14,
      height: 14,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_kit/app/utils/colors.dart';

class ProfileImage extends StatelessWidget {
  final String url;
  static final _radius = 10.0;

  ProfileImage({@required this.url});

  @override
  Widget build(BuildContext context) => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryLight,
          borderRadius: BorderRadius.circular(_radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: Image(
            image: NetworkImage(url),
          ),
        ),
      );
}

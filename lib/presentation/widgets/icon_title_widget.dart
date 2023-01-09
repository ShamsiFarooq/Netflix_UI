import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

import '../../core/constants.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 25,
        ),
        kHeight5,
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

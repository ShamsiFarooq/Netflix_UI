import 'package:flutter/material.dart';


class MainCardHome extends StatelessWidget {
  final String imageUrl;
  const MainCardHome({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      width: size.width * .3,
      height: size.width * .5,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

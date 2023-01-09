import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';


class NumberCardWidget extends StatelessWidget {
  const  NumberCardWidget({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              width: size.width * .3,
              height: size.width * .5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
        Positioned(
            bottom: -20,
            left: 0,
            child: BorderedText(
              strokeWidth: 3,
              strokeColor: Colors.white,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.transparent,
                    fontSize: 130,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

const imgHomeUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgHomeUrl), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconTitle(icon: Icons.add, text: 'My List'),
                _playButton(),
                _iconTitle(icon: Icons.info_outline, text: 'Info'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column _iconTitle({required IconData icon, required String text}) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 30,
        ),
        Text(
          text,
          style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow_sharp,
          size: 25,
          color: kButtonColorBlack,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Play',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kButtonColorBlack),
          ),
        ));
  }
}

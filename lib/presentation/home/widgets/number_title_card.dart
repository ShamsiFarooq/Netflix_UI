import 'package:flutter/material.dart';

import '../../widgets/title_text_widget.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key, required this.posterList,
  }) : super(key: key);
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: 'Top 10 TV Shows in India Today'),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(posterList.length, (index) {
              return NumberCardWidget(
                imageUrl: posterList[index],
                index: index,
              );
            }),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import '../../../core/constants.dart';
import '../../widgets/icon_title_widget.dart';

const imgUrl3 =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/198vrF8k7mfQ4FjDJsBmdQcaiyq.jpg';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children: [
              Text(month,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5))),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VideoWidget(
                    imageUrl: posterPath,
                  ),
                ),
                kHeight,
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -3),
                            overflow: TextOverflow.clip,
                            softWrap: false,
                            maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          IconTitle(
                              icon: Icons.notifications_outlined,
                              text: 'Remind Me'),
                          kWidth20,
                          IconTitle(icon: Icons.info_outline, text: 'info'),
                        ],
                      ),
                    )
                  ],
                ),
                kHeight,
                Text(
                  'Coming on $day $month',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8)),
                ),
                kHeight,
                Text(
                  movieName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight,
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.5),
                      height: 1.5),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

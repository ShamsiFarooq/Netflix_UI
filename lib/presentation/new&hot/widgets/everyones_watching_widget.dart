import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/constants.dart';
import '../../widgets/icon_title_widget.dart';

const imgUrl4 =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/etj8E2o0Bud0HkONVQPjyCkIvpv.jpg';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoWidget(imageUrl: posterPath),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                movieName,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      if (posterPath != null) {
                        Share.share(posterPath);
                      }
                    },
                    child: IconTitle(icon: Icons.share, text: 'Share')),
                kWidth20,
                IconTitle(icon: Icons.add, text: 'My List'),
                kWidth20,
                IconTitle(icon: Icons.play_arrow_sharp, text: 'Play'),
                kWidth20,
              ],
            ),
          ],
        ),
        kHeight,
        Center(
          child: Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.5),
                height: 1.5),
          ),
        ),
        kHeight40,
      ],
    );
  }
}

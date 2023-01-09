import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import '../widgets/main_title_card.dart';

const imgLogo =
    'https://1000logos.net/wp-content/uploads/2017/05/Netflix-Logo-2006.png';
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              //print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (state.isError) {
                      return const Center(
                        child: Text('Error while loading'),
                      );
                    }

                    final _releasesPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    final _trendingMovies = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trendingMovies.shuffle();

                    final _tenseDramas = state.tenseDramasMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _tenseDramas.shuffle();

                    final _southIndianMovies = state.southIndianMoviesList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();

                    final _trendingTv = state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    _trendingTv.shuffle();
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        kHeight,
                        if(_releasesPastYear.length >= 10)
                        MainCardTitle(
                          title: 'Released in the Past Year',
                          posterList: _releasesPastYear.sublist(0, 10),
                        ),
                        kHeight,
                        if(_trendingMovies.length >= 10)
                        MainCardTitle(
                          title: 'Trending Now',
                          posterList: _trendingMovies.sublist(0, 10),
                        ),
                        kHeight,
                        if(_trendingTv.length >= 10)
                        NumberTitleCard(posterList: _trendingTv.sublist(0, 10)),
                        kHeight,
                        if(_tenseDramas.length >= 10)
                        MainCardTitle(
                          title: 'Tense Dramas',
                          posterList: _tenseDramas.sublist(0, 10),
                        ),
                        kHeight,
                        if(_southIndianMovies.length >= 10)
                        MainCardTitle(
                          title: 'South Indian Cinema',
                          posterList: _southIndianMovies.sublist(0, 10),
                        ),
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  imgLogo,
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                HeaderText(text: 'TV Shows'),
                                HeaderText(text: 'Movies'),
                                Row(
                                  children: [
                                    HeaderText(text: 'Categories'),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: kWhiteColor,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          );
        },
      )),
    );
  }

  Text HeaderText({required String text}) => Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
}

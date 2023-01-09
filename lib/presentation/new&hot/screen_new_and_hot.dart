import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/new&hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new&hot/widgets/everyones_watching_widget.dart';
import 'package:netflix_clone/presentation/widgets/icon_title_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 3),
                child: Container(
                  width: 30,
                  height: 20,
                  color: Colors.blue,
                ),
              ),
              kWidth,
            ],
            bottom: TabBar(
                indicatorWeight: 0,
                isScrollable: true,
                labelColor: kBlackColor,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                unselectedLabelColor: kWhiteColor,
                indicator: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(30)),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(text: '👀 Everyone\'s Watching')
                ]),
          ),
        ),
        body: const TabBarView(
          children: [
                ComingSoonList(key: Key('coming_soon'),),
                EveryoneIsWatchingList(key: Key('everyone_is_watching'),)
          ],
        )
      ),
    );
  }
  // Widget _buildEveryonesWatching() {
  //   return Padding(
  //     padding: EdgeInsets.all(8.0),
  //     child: ListView.builder(
  //       itemBuilder: (context, index) => SizedBox(),
  //       //EveryonesWatchingWidget(),
  //       itemCount: 10,
  //     ),
  //   );
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async{
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while loading the coming soon list'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Coming soon list is empty'),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top:8),
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                String month = '';
                String date = '';
                print(movie.releaseDate);
                try{
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formatedDate =  DateFormat.yMMMMd('en_US').format(_date);
                  month = formatedDate.split(' ').first.substring(0, 3);
                  date = movie.releaseDate!.split('-')[2];
                }catch(_){
                  month = '';
                }
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterPath:'$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle??'No title',
                  description: movie.overview??'No description',
                );
              },
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async{
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while loading the coming soon list'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('Everyone is watching list is empty'),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final tv = state.everyOneIsWatchingList[index];
                return EveryonesWatchingWidget(
                  posterPath:'$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalName??'No title',
                  description: tv.overview??'No description',
                );
              },
              itemCount: state.everyOneIsWatchingList.length,
            );
          }
        },
      ),
    );
  }
}
  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //     itemBuilder: (context, index) => ComingSoonWidget(),
  //     itemCount: 10,
  //   );
  // }

  


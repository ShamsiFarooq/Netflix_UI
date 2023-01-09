import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domain/core/di/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/presentation/main_page/widgets/screen_main_page.dart';

import 'application/fast_laugh/fast_laugh_bloc.dart';
import 'application/home/home_bloc.dart';
import 'application/hot_and_new/hot_and_new_bloc.dart';
import 'application/search/search_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurInjection();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: kButtonColorBlack),
            scaffoldBackgroundColor: bgColor,
            primarySwatch: Colors.blue,
            fontFamily: GoogleFonts.roboto().fontFamily,
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}

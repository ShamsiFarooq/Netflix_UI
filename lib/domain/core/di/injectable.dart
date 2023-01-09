import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/infrastructure/hot_and_new/hot_and_new_impl.dart';

import '../../../application/hot_and_new/hot_and_new_bloc.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

void setup() {
  // getIt.registerSingleton<HotAndNewImpl>(HotAndNewImpl(),signalsReady: true);
  // getIt.registerFactory<HotAndNewBloc>(
  // () => HotAndNewBloc(HotAndNewImpl()));
}

@InjectableInit()
Future<void> configurInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}

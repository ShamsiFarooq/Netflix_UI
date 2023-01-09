import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/%20hot_and_new/hot_and_new_service.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';

import '../../domain/ hot_and_new/models/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    /*
    on event get homescreen data
    */

    on<GetHomeScreenData>((event, emit) async {
      //send laoding to ui
      emit(state.copyWith(isLoading: true, isError: false));

      //get  Data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      // print(_movieResult.);
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transform data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
              stateId:DateTime.now().millisecondsSinceEpoch.toString() ,
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseDramasMovieList: [],
              southIndianMoviesList: [],
              trendingTvList: [],
              isLoading: false,
              isError: true);
              
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trendingMovies = resp.results;
          final tenseDramas = resp.results;
          final southIndian = resp.results;
         return HomeState(
              stateId:DateTime.now().millisecondsSinceEpoch.toString() ,
              pastYearMovieList: pastYear,
              trendingMovieList: trendingMovies,
              tenseDramasMovieList: tenseDramas,
              southIndianMoviesList: southIndian,
              trendingTvList: state.trendingTvList,
              isLoading: false,
              isError: false
          );
        },
      );
      
      if(_state1 != null){
        emit(_state1);
      }
      

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return HomeState(
              stateId:DateTime.now().millisecondsSinceEpoch.toString() ,
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseDramasMovieList: [],
              southIndianMoviesList: [],
              trendingTvList: [],
              isLoading: false,
              isError: true);
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return HomeState(
              stateId:DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: state.pastYearMovieList,
              trendingMovieList: state.trendingMovieList,
              tenseDramasMovieList: state.tenseDramasMovieList,
              southIndianMoviesList: state.southIndianMoviesList,
              trendingTvList: top10List,
              isLoading: false,
              isError: false);
        },
      );
      log(_state2.toString());
      if(_state2 != null){
        emit(_state2);
      }
      //send to ui
    });
  }
}

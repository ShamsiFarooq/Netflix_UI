import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/%20hot_and_new/models/hot_and_new_resp.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';

abstract class HotAndNewService{

  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}
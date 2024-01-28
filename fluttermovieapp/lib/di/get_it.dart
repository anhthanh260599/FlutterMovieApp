

import 'package:fluttermovieapp/data/core/api_clients.dart';
import 'package:fluttermovieapp/data/data_sources/movie_remote_data_source.dart';
import 'package:fluttermovieapp/data/repositories/movie_repository_imple.dart';
import 'package:fluttermovieapp/domain/repositories/movie_repositories.dart';
import 'package:fluttermovieapp/domain/usecases/get_coming_soon.dart';
import 'package:fluttermovieapp/domain/usecases/get_playing_now.dart';
import 'package:fluttermovieapp/domain/usecases/get_popular.dart';
import 'package:fluttermovieapp/domain/usecases/get_trending.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstant = GetIt.I;

Future init() async {
  getItInstant.registerLazySingleton<Client>(() => Client());
  getItInstant.registerLazySingleton<ApiClient>(() => ApiClient(getItInstant()));
  getItInstant.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstant()));

  // usecase
  getItInstant.registerLazySingleton<GetTrending>(() => GetTrending(getItInstant()));
  getItInstant.registerLazySingleton<GetPopular>(() => GetPopular(getItInstant()));
  getItInstant.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstant()));
  getItInstant.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstant()));


  //movie repository
  getItInstant.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstant()));


  // movie backdrop
  getItInstant.registerFactory(() => MovieBackdropBloc());

  getItInstant.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstant(),
      movieBackdropBloc: getItInstant()
      )); 

}
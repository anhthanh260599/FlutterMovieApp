import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttermovieapp/domain/entities/app_error.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/domain/entities/no_params.dart';
import 'package:fluttermovieapp/domain/usecases/get_coming_soon.dart';
import 'package:fluttermovieapp/domain/usecases/get_playing_now.dart';
import 'package:fluttermovieapp/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {

  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;  


  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,

  }) : super(MovieTabbedInitial()) {
    on<MovieTabbedEvent>((event, emit) async {
      if (event is MovieTabChangeEvent) {
        Either<AppError, List<MovieEntity>>? moviesEither;
        switch(event.currentTabIndex) {
          case 0: // Tab đầu tiên
            moviesEither = await getPopular(NoParams());
            break;
          case 1: // Tab thứ 2
            moviesEither = await getPlayingNow(NoParams());
            break;
          case 2: // Tab thứ 3  
            moviesEither = await getComingSoon(NoParams());
            break;
        }

        moviesEither!.fold(
          (l) => emit(MovieTabLoadError(currentTabIndex: event.currentTabIndex)), 
          (movies) {
            emit(MovieTabChanged(currentTabIndex: event.currentTabIndex, movies: movies));
          });
      }
    });
  }
}

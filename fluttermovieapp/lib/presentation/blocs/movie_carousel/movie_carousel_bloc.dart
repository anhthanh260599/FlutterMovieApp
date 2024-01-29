import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/domain/entities/no_params.dart';
import 'package:fluttermovieapp/domain/usecases/get_trending.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc
  }) : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      if (event is CarouselLoadEvent) {
        final movieEither = await getTrending(NoParams()); // slider danh sách phim trending

        movieEither.fold(
          (l) {
            emit(MovieCarouselError());
          },
          (movies) {
            movieBackdropBloc.add(MovieBackdropChangedEvent(movies[event.defaultIndex]));

            emit(MovieCarouselLoaded(
              movies: movies,
              defaultIndex: event.defaultIndex,
            ));
          },
        );
      }
    });
  }
}

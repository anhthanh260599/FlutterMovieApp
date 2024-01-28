part of 'movie_carousel_bloc.dart';

sealed class MovieCarouselState extends Equatable {
  const MovieCarouselState();
  
  @override
  List<Object> get props => [];
}

final class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState{}

class MovieCarouselLoaded extends MovieCarouselState{
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    required this.movies, // Thêm required để không được phép null
    this.defaultIndex = 0
  }) : assert(defaultIndex >= 0, 'defaultIndex không được phép nhỏ hơn 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}

part of 'movie_carousel_bloc.dart';


sealed class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0}) : assert(defaultIndex >= 0, 'defaultIndex không được nhỏ hơn 0');

  @override
  List<Object> get props => [defaultIndex];

}

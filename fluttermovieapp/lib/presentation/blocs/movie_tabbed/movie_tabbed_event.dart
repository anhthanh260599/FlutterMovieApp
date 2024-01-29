part of 'movie_tabbed_bloc.dart';

sealed class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangeEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  const MovieTabChangeEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];

}

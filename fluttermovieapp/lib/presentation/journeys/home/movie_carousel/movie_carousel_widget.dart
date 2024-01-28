import 'package:flutter/material.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:fluttermovieapp/presentation/widgets/movie_app_bar.dart';
import 'package:fluttermovieapp/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {

  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex
  }) : assert (defaultIndex >= 0, 'defaultIndex không thể nhỏ hơn 0'),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
          MovieBackdropWidget(),
          Column(
          children: [
            MovieAppBar(), // Appbar 
            MoviePageView( // Slide các item phim
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(), // Tên phim
            Separator() // đường gạch ở dưới
          ],
        )
      ],
    );
  }
}
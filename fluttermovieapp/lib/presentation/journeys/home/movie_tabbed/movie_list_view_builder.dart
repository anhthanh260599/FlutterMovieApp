import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({
    Key? key,
    required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
      shrinkWrap: true,
      itemCount: movies.length, // số lượng phim hiển thị
      scrollDirection: Axis.horizontal, // hướng scroll
      separatorBuilder: (context,index) {
        return SizedBox( // margin giữa các card phim
          width: 14.w.toDouble(),
        );
      }, 
      itemBuilder: (context, index) {
        final MovieEntity movie = movies[index];
        return MovieTabCardWidget(
          movieId: movie.id, 
          title: movie.title, 
          posterPath: movie.posterPath
        );
      },
    ) ,
    );
  }
}
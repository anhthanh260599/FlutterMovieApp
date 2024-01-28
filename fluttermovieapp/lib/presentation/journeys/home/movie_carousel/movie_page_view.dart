import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/common/sceenutils/sceenutils.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key? key,
    required this.movies,
    required this.initialPage,
  }) : assert(initialPage >= 0, 'Trang không được nhỏ hơn 0'),
      super (key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h.toDouble()),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimateMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movie.id, 
            posterPath: movie.posterPath,
            
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context).add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
    
}
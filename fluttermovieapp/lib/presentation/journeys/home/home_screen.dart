import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermovieapp/data/core/api_constants.dart';
import 'package:fluttermovieapp/di/get_it.dart';
import 'package:fluttermovieapp/presentation/blocs/language/language_bloc.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import 'package:fluttermovieapp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:fluttermovieapp/presentation/journeys/drawer/navigation_drawer.dart' as naviagation_drawer;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  late LanguageBloc languageBloc;

  @override
  void initState(){
    super.initState();
    languageBloc = getItInstant<LanguageBloc>();
    movieCarouselBloc = getItInstant<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstant<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    languageBloc?.close();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
  }

    Future<void> _refreshData() async {
      languageBloc = getItInstant<LanguageBloc>();
      movieCarouselBloc = getItInstant<MovieCarouselBloc>();
      movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
      movieTabbedBloc = getItInstant<MovieTabbedBloc>();
      movieCarouselBloc.add(CarouselLoadEvent());
  }

 @override
Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider.value(value: languageBloc),
      BlocProvider.value(value: movieCarouselBloc),
      BlocProvider.value(value: movieBackdropBloc),
      BlocProvider.value(value: movieTabbedBloc),
    ],
    child: Scaffold(
      drawer: const naviagation_drawer.NavigationDrawer(), // Thanh menu Navigation
      body: BlocBuilder<LanguageBloc, LanguageState>(
        bloc: languageBloc,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
              bloc: movieCarouselBloc,
              builder: (context, state) {
                if (state is MovieCarouselLoaded) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.6,
                        child: MovieCarouselWidget(
                          movies: state.movies,
                          defaultIndex: state.defaultIndex,
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.4,
                        child: MovieTabbedWidget(),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          );
        },
      ),
     
    ),
  );
}
}
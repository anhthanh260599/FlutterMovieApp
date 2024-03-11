import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:fluttermovieapp/presentation/journeys/home/movie_tabbed/tab_tittle_widget.dart';

class MovieTabbedWidget extends StatefulWidget { 

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();

}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> with SingleTickerProviderStateMixin {

  MovieTabbedBloc get movieTabbedBloc => BlocProvider.of<MovieTabbedBloc>(context);


  int currentTabIndex = 0;


  @override
  void initState(){
    super.initState();
    movieTabbedBloc.add(MovieTabChangeEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context,state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for(var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title, 
                    onTap: () => _onTapTapped(i),
                    isSelected: MovieTabbedConstants.movieTabs[i].index == state.currentTabIndex,
                  )
                  
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies,)
                  ),
            ],
            ),
          );
      }
      );
  }

  // Hàm bắt sự kiện đổi tab
  void _onTapTapped(int index) {
      movieTabbedBloc.add(MovieTabChangeEvent(currentTabIndex: index));
  }
}
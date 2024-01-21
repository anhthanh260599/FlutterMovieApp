import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:fluttermovieapp/data/core/api_clients.dart';
import 'package:fluttermovieapp/data/repositories/movie_repository_imple.dart';
import 'package:fluttermovieapp/domain/entities/app_error.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/domain/entities/no_params.dart';
import 'package:fluttermovieapp/domain/repositories/movie_repositories.dart';
import 'package:fluttermovieapp/domain/usecases/get_popular.dart';
import 'package:fluttermovieapp/domain/usecases/get_trending.dart';
import 'package:http/http.dart' as http;
import 'package:fluttermovieapp/data/data_sources/movie_remote_data_source.dart';

Future<void> main() async {
   ApiClient apiClient = ApiClient(http.Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);

  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);

  GetTrending getTrending = GetTrending(movieRepository);
  GetPopular getPopular = GetPopular(movieRepository);

  final Either<AppError,List<MovieEntity>> eitherResponse = await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      print("Lỗi");
      print(l);
    },
    (r) {
      print("Danh sách phim");
      print(r);
    });

    final Either<AppError,List<MovieEntity>> eitherResponse2 = await getPopular(NoParams());
   eitherResponse2.fold(
    (l) {
      print("Lỗi");
      print(l);
    },
    (r) {
      print("Danh sách phim");
      print(r);
    });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Container(),
    );
  }
}
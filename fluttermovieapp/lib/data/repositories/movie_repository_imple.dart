import 'package:dartz/dartz.dart';
import 'package:fluttermovieapp/data/data_sources/movie_remote_data_source.dart';
import 'package:fluttermovieapp/data/models/movie_model.dart';
import 'package:fluttermovieapp/domain/entities/app_error.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/domain/repositories/movie_repositories.dart';

// Xài Design Pattern Repository
class MovieRepositoryImpl extends MovieRepository {

  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either< AppError ,List<MovieModel>>> getTrending() async {

    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    }
    on Exception {
      return Left(AppError("có lỗi xảy ra"));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    }
    on Exception {
      return Left(AppError("có lỗi xảy ra"));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
     try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    }
    on Exception {
      return Left(AppError("có lỗi xảy ra"));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async{
   try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    }
    on Exception {
      return Left(AppError("có lỗi xảy ra"));
    }
  }
  
}
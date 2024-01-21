import 'package:dartz/dartz.dart';
import 'package:fluttermovieapp/domain/entities/app_error.dart';
import 'package:fluttermovieapp/domain/entities/movie_entity.dart';
import 'package:fluttermovieapp/domain/entities/no_params.dart';
import 'package:fluttermovieapp/domain/repositories/movie_repositories.dart';
import 'package:fluttermovieapp/domain/usecases/usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>,NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError,List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
  } 
}
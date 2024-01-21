import 'package:dartz/dartz.dart';
import 'package:fluttermovieapp/domain/entities/app_error.dart';

/// <summary>
///   Type: Output: kiểu dữ liệu trả về
///   Params: Input: Tham số
/// </summary>
abstract class UseCase<Type,Params> {
    Future<Either<AppError,Type>> call(Params params);
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

Future<Either<Exception, Payload>> exception2either<Payload>(
    {required Future<Payload> Function() function}) async {
  try {
    return Right(await function());
  } catch (exception) {
    print('exception2either: $exception');
    if (exception is DioError) {
      print('EXCEPTION: ${exception.response?.data['error']}');
      return Left(Exception(exception.response?.data['error']));
    } else {
      return Left(Exception('Unknown error'));
    }
  }
}

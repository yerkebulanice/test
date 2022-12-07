import 'package:dartz/dartz.dart';

Future<Either<String, Payload>> exception2either<Payload>(
    {required Future<Payload> Function() function}) async {
  try {
    return Right(await function());
  } catch (exception) {
    return Left('Error ${exception.toString()}');
  }
}

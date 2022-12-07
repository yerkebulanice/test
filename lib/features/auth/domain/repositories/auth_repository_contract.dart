import 'package:dartz/dartz.dart';
import 'package:test_task/features/auth/domain/entities/sign_in_entity.dart';
import 'package:test_task/features/auth/domain/entities/sign_up_entity.dart';
import 'package:test_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:test_task/features/auth/domain/usecases/sign_up_usecase.dart';

abstract class AuthRepositoryContract {
  Future<Either<String, SignInEntity>> signIn(SigninParams signinParams);
  Future<Either<String, SignUpEntity>> signUp(SignupParams signupParams);
}

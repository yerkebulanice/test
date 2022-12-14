import 'package:dartz/dartz.dart';
import 'package:test_task/core/exception/exception2either.dart';
import 'package:test_task/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:test_task/features/auth/data/models/sign_in_model.dart';
import 'package:test_task/features/auth/data/models/sign_up_model.dart';
import 'package:test_task/features/auth/domain/entities/sign_in_entity.dart';
import 'package:test_task/features/auth/domain/entities/sign_up_entity.dart';
import 'package:test_task/features/auth/domain/repositories/auth_repository_contract.dart';
import 'package:test_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:test_task/features/auth/domain/usecases/sign_up_usecase.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  final AuthRemoteDataSourceContract remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, SignInEntity>> signIn(SigninParams signinParams) async {
    return exception2either(function: () async {
      final SignInModel signInModel = await remoteDataSource.signIn(signinParams.getBody());
      return signInModel;
    });
  }

  @override
  Future<Either<Exception, SignUpEntity>> signUp(SignupParams signinParams) async {
    return exception2either(function: () async {
      final SignUpModel signUpModel = await remoteDataSource.signUp(signinParams.getBody());
      return signUpModel;
    });
  }
}

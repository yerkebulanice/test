import 'package:dartz/dartz.dart';
import 'package:test_task/core/params_parent.dart';
import 'package:test_task/core/usecase.dart';
import 'package:test_task/features/auth/domain/entities/sign_in_entity.dart';
import 'package:test_task/features/auth/domain/repositories/auth_repository_contract.dart';

class SigninUsecase implements UseCase<SignInEntity, SigninParams> {
  final AuthRepositoryContract _repositoryContract;
  SigninUsecase(this._repositoryContract);

  @override
  Future<Either<String, SignInEntity>> call(SigninParams params) async {
    return _repositoryContract.signIn(params);
  }
}

class SigninParams extends ParamsParent {
  final String email;
  final String password;

  const SigninParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email];

  @override
  Map<String, dynamic> getBody({Map<String, dynamic> params = const {}}) {
    return {
      "email": email,
      "password": password,
    };
  }
}

import 'package:dartz/dartz.dart';
import 'package:test_task/core/params_parent.dart';
import 'package:test_task/core/usecase.dart';
import 'package:test_task/features/auth/domain/entities/sign_up_entity.dart';
import 'package:test_task/features/auth/domain/repositories/auth_repository_contract.dart';

class SignupUsecase implements UseCase<SignUpEntity, SignupParams> {
  final AuthRepositoryContract _repositoryContract;
  SignupUsecase(this._repositoryContract);

  @override
  Future<Either<String, SignUpEntity>> call(SignupParams params) async {
    return _repositoryContract.signUp(params);
  }
}

class SignupParams extends ParamsParent {
  final String username;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String phone;

  const SignupParams({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [email];

  @override
  Map<String, dynamic> getBody({Map<String, dynamic> params = const {}}) {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phone": phone,
    };
  }
}

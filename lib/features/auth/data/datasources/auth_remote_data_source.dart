import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test_task/config/network/custom_dio.dart';
import 'package:test_task/features/auth/data/models/sign_in_model.dart';
import 'package:test_task/features/auth/data/models/sign_up_model.dart';

part 'auth_remote_data_source.g.dart';

abstract class AuthRemoteDataSourceContract {
  Future<SignInModel> signIn(@Body() Map<String, dynamic> body);
  Future<SignUpModel> signUp(@Body() Map<String, dynamic> body);
}

@RestApi()
abstract class AuthRemoteDataSourceImpl implements AuthRemoteDataSourceContract {
  factory AuthRemoteDataSourceImpl({required CustomAuthDio dioWrapper, String? baseUrl}) =>
      _AuthRemoteDataSourceImpl(dioWrapper.dio, baseUrl: baseUrl);

  @override
  @POST("/users/login")
  Future<SignInModel> signIn(@Body() Map<String, dynamic> body);

  @override
  @POST("/users/signup")
  Future<SignUpModel> signUp(@Body() Map<String, dynamic> body);
}

import 'package:get_it/get_it.dart';
import 'package:test_task/config/network/custom_dio.dart';
import 'package:test_task/core/service_locator.dart';
import 'package:test_task/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:test_task/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:test_task/features/auth/domain/repositories/auth_repository_contract.dart';
import 'package:test_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:test_task/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';

class AuthServiceLocator extends ServiceLocator {
  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<AuthBloc>(() => AuthBloc(signinUsecase: sl(), signupUsecase: sl()));
    // use cases
    sl.registerLazySingleton(() => SigninUsecase(sl()));
    sl.registerLazySingleton(() => SignupUsecase(sl()));
    // repositories
    sl.registerLazySingleton<AuthRepositoryContract>(
        () => AuthRepositoryImpl(remoteDataSource: sl()));
    // data sources
    sl.registerLazySingleton<AuthRemoteDataSourceContract>(
        () => AuthRemoteDataSourceImpl(dioWrapper: sl<CustomAuthDio>()));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/features/auth/domain/entities/sign_in_entity.dart';
import 'package:test_task/features/auth/domain/entities/sign_up_entity.dart';
import 'package:test_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:test_task/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUsecase signinUsecase;
  final SignupUsecase signupUsecase;
  AuthBloc({required this.signinUsecase, required this.signupUsecase}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignInEvent>(signIn);
    on<SignUpEvent>(signUp);
  }

  Future<void> signIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final result = await signinUsecase(SigninParams(email: event.email, password: event.password));
    result.fold(
      (Exception error) {
        emit(FailureAuthState(message: error.toString()));
      },
      (SignInEntity entity) {
        emit(SignInState(signInEntity: entity));
      },
    );
  }

  Future<void> signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final result = await signupUsecase(SignupParams(
      username: event.username,
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      phone: event.phone,
      password: event.password,
    ));
    result.fold(
      (Exception error) => emit(FailureAuthState(message: error.toString())),
      (SignUpEntity entity) => emit(SignUpState(signUpEntity: entity)),
    );
  }
}

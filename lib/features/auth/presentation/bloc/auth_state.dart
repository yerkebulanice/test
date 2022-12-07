part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final String message;
  FailureAuthState({required this.message});
}

class SignInState extends AuthState {
  final SignInEntity signInEntity;
  SignInState({required this.signInEntity});
}

class SignUpState extends AuthState {
  final SignUpEntity signUpEntity;
  SignUpState({required this.signUpEntity});
}

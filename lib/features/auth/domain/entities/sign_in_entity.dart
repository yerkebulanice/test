import 'package:equatable/equatable.dart';

abstract class SignInEntity extends Equatable {
  final String accessToken;
  final String refreshToken;

  const SignInEntity({required this.accessToken, required this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

import 'package:equatable/equatable.dart';

abstract class SignUpEntity extends Equatable {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const SignUpEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [username, firstName, lastName, email, phone];
}

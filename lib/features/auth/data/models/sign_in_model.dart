import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/features/auth/domain/entities/sign_in_entity.dart';

part 'sign_in_model.g.dart';

@JsonSerializable(includeIfNull: true)
class SignInModel extends SignInEntity {
  const SignInModel({required super.accessToken, required super.refreshToken});

  factory SignInModel.fromJson(Map<String, dynamic> json) => _$SignInModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}

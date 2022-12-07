import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/features/auth/domain/entities/sign_up_entity.dart';

part 'sign_up_model.g.dart';

@JsonSerializable(includeIfNull: true)
class SignUpModel extends SignUpEntity {
  const SignUpModel({
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}

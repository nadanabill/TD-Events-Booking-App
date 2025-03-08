import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final bool success;
  final String message;
  final User data;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}

@JsonSerializable()
class User {
  final String userId;
  final String name;
  final String email;

  User({
    required this.userId,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: User.fromJson(json['data'] as Map<String, dynamic>),
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

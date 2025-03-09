// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailsModel _$EventDetailsModelFromJson(Map<String, dynamic> json) =>
    EventDetailsModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Event.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDetailsModelToJson(EventDetailsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEventsModel _$AllEventsModelFromJson(Map<String, dynamic> json) =>
    AllEventsModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllEventsModelToJson(AllEventsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['current_page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      totalItems: (json['total_items'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'total_items': instance.totalItems,
      'total_pages': instance.totalPages,
      'events': instance.events,
    };

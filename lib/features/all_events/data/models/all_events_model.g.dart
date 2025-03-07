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
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Events.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'events': instance.events,
    };

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      eventId: (json['eventId'] as num?)?.toInt(),
      picture: json['picture'] as String?,
      date: json['date'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      numberOfGoing: (json['numberOfGoing'] as num?)?.toInt(),
      organizer: json['organizer'] == null
          ? null
          : Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'picture': instance.picture,
      'date': instance.date,
      'title': instance.title,
      'address': instance.address,
      'numberOfGoing': instance.numberOfGoing,
      'organizer': instance.organizer,
    };

Organizer _$OrganizerFromJson(Map<String, dynamic> json) => Organizer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$OrganizerToJson(Organizer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
    };

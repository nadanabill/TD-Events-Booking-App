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
          : EventData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDetailsModelToJson(EventDetailsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

EventData _$EventDataFromJson(Map<String, dynamic> json) => EventData(
      eventId: (json['event_id'] as num?)?.toInt(),
      picture: json['picture'] as String?,
      date: json['date'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      numberOfGoing: (json['number_of_going'] as num?)?.toInt(),
      addressTitle: json['address_title'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      aboutEvent: json['about_event'] as String?,
      eventPrice: json['event_price'] as String?,
      organizer: json['organizer'] == null
          ? null
          : Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDataToJson(EventData instance) => <String, dynamic>{
      'event_id': instance.eventId,
      'picture': instance.picture,
      'date': instance.date,
      'title': instance.title,
      'address': instance.address,
      'number_of_going': instance.numberOfGoing,
      'address_title': instance.addressTitle,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'about_event': instance.aboutEvent,
      'event_price': instance.eventPrice,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
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

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
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

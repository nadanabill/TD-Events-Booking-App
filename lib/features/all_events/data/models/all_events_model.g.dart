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

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['current_page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      totalItems: (json['total_items'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Events.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      eventId: (json['event_id'] as num?)?.toInt(),
      picture: json['picture'] as String?,
      date: json['date'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      numberOfGoing: (json['number_of_going'] as num?)?.toInt(),
      organizer: json['organizer'] == null
          ? null
          : Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
    );

Organizer _$OrganizerFromJson(Map<String, dynamic> json) => Organizer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      picture: json['picture'] as String?,
    );

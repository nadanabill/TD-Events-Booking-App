import 'package:json_annotation/json_annotation.dart';

part 'all_events_model.g.dart';

@JsonSerializable()
class AllEventsModel {
  final bool success;
  final String message;
  final Data data;

  AllEventsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AllEventsModel.fromJson(Map<String, dynamic> json) =>
      _$AllEventsModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'page_size')
  int? pageSize;
  @JsonKey(name: 'total_items')
  int? totalItems;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  List<Events>? events;

  Data({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
    required this.events,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Events {
  @JsonKey(name: 'event_id')
  int? eventId;
  String? picture;
  String? date;
  String? title;
  String? address;
  @JsonKey(name: 'number_of_going')
  int? numberOfGoing;
  Organizer? organizer;

  Events({
    required this.eventId,
    required this.picture,
    required this.date,
    required this.title,
    required this.address,
    required this.numberOfGoing,
    required this.organizer,
  });

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
}

@JsonSerializable()
class Organizer {
  int? id;
  String? name;
  String? picture;

  Organizer({
    required this.id,
    required this.name,
    required this.picture,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
}

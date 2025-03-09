import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class Event {
  @JsonKey(name: 'event_id')
  int? eventId;
  String? picture;
  String? date;
  String? title;
  String? address;
  @JsonKey(name: 'number_of_going')
  int? numberOfGoing;
  @JsonKey(name: 'address_title')
  String? addressTitle;
  String? latitude;
  String? longitude;
  @JsonKey(name: 'about_event')
  String? aboutEvent;
  @JsonKey(name: 'event_price')
  String? eventPrice;
  Organizer? organizer;

  Event({
    this.eventId,
    this.picture,
    this.date,
    this.title,
    this.address,
    this.numberOfGoing,
    this.addressTitle,
    this.latitude,
    this.longitude,
    this.aboutEvent,
    this.eventPrice,
    this.organizer,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
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

  Map<String, dynamic> toJson() => _$OrganizerToJson(this);
}

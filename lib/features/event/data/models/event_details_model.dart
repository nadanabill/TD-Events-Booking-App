import 'package:json_annotation/json_annotation.dart';

part 'event_details_model.g.dart';

@JsonSerializable()
class EventDetailsModel {
  bool? success;
  String? message;
  EventData? data;

  EventDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsModelFromJson(json);
}

@JsonSerializable()
class EventData {
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

  EventData({
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

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);
}

@JsonSerializable()
class Organizer {
  int? id;
  String? name;
  String? picture;

  Organizer({
    this.id,
    this.name,
    this.picture,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
}

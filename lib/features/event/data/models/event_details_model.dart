import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/event_model.dart';

part 'event_details_model.g.dart';

@JsonSerializable()
class EventDetailsModel {
  bool? success;
  String? message;
  Event? data;

  EventDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsModelFromJson(json);
}

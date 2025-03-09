import 'package:json_annotation/json_annotation.dart';
import 'package:td_events_booking/core/models/event_model.dart';

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
  List<Event>? events;

  Data({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
    required this.events,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

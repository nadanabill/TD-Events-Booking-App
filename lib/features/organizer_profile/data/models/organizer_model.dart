import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizer_model.g.dart';

@JsonSerializable()
class OrganizerModel {
  bool? success;
  String? message;
  OrganizerData? data;

  OrganizerModel({
    this.success,
    this.message,
    this.data,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizerModelFromJson(json);
}

@JsonSerializable()
class OrganizerData {
  String? name;
  String? picture;
  @JsonKey(name: "number_of_following")
  int? numberOfFollowing;
  @JsonKey(name: "number_of_followers")
  int? numberOfFollowers;
  String? about;
  List<OrganizerEvents>? events;
  List<OrganizerReviews>? reviews;

  OrganizerData({
    this.name,
    this.picture,
    this.numberOfFollowing,
    this.numberOfFollowers,
    this.about,
    this.events,
    this.reviews,
  });

  factory OrganizerData.fromJson(Map<String, dynamic> json) =>
      _$OrganizerDataFromJson(json);
}

@JsonSerializable()
class OrganizerEvents {
  int? id;
  String? picture;
  String? date;
  String? title;

  OrganizerEvents({
    this.id,
    this.picture,
    this.date,
    this.title,
  });

  factory OrganizerEvents.fromJson(Map<String, dynamic> json) =>
      _$OrganizerEventsFromJson(json);
}

@JsonSerializable()
class OrganizerReviews {
  int? reviewId;
  @JsonKey(name: "reviewer_picture")
  String? reviewerPicture;
  @JsonKey(name: "reviewer_name")
  String? reviewerName;
  int? rate;
  String? review;
  @JsonKey(name: "review_date")
  String? reviewDate;

  OrganizerReviews({
    this.reviewId,
    this.reviewerPicture,
    this.reviewerName,
    this.rate,
    this.review,
    this.reviewDate,
  });

  factory OrganizerReviews.fromJson(Map<String, dynamic> json) =>
      _$OrganizerReviewsFromJson(json);
}

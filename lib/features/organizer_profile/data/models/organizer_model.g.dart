// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizerModel _$OrganizerModelFromJson(Map<String, dynamic> json) =>
    OrganizerModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OrganizerData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrganizerModelToJson(OrganizerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

OrganizerData _$OrganizerDataFromJson(Map<String, dynamic> json) =>
    OrganizerData(
      name: json['name'] as String?,
      picture: json['picture'] as String?,
      numberOfFollowing: (json['number_of_following'] as num?)?.toInt(),
      numberOfFollowers: (json['number_of_followers'] as num?)?.toInt(),
      about: json['about'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => OrganizerEvents.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => OrganizerReviews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrganizerDataToJson(OrganizerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picture': instance.picture,
      'number_of_following': instance.numberOfFollowing,
      'number_of_followers': instance.numberOfFollowers,
      'about': instance.about,
      'events': instance.events,
      'reviews': instance.reviews,
    };

OrganizerEvents _$OrganizerEventsFromJson(Map<String, dynamic> json) =>
    OrganizerEvents(
      id: (json['id'] as num?)?.toInt(),
      picture: json['picture'] as String?,
      date: json['date'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$OrganizerEventsToJson(OrganizerEvents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picture': instance.picture,
      'date': instance.date,
      'title': instance.title,
    };

OrganizerReviews _$OrganizerReviewsFromJson(Map<String, dynamic> json) =>
    OrganizerReviews(
      reviewId: (json['reviewId'] as num?)?.toInt(),
      reviewerPicture: json['reviewer_picture'] as String?,
      reviewerName: json['reviewer_name'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      review: json['review'] as String?,
      reviewDate: json['review_date'] as String?,
    );

Map<String, dynamic> _$OrganizerReviewsToJson(OrganizerReviews instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'reviewer_picture': instance.reviewerPicture,
      'reviewer_name': instance.reviewerName,
      'rate': instance.rate,
      'review': instance.review,
      'review_date': instance.reviewDate,
    };

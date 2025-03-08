part of 'event_details_cubit.dart';

sealed class EventDetailsState {}

final class EventDetailsInitial extends EventDetailsState {}

final class EventDetailsLoading extends EventDetailsState {}

final class EventDetailsSuccess extends EventDetailsState {
  final EventDetailsModel event;

  EventDetailsSuccess({required this.event});
}

final class EventDetailsFailure extends EventDetailsState {
  final String error;

  EventDetailsFailure({required this.error});
}

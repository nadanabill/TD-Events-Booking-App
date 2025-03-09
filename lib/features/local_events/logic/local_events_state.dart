part of 'local_events_cubit.dart';

sealed class EventsState {}

final class EventsInitial extends EventsState {}

final class AllEventsLocalLoading extends EventsState {}

final class AllEventsLocalSuccess extends EventsState {}

final class AllEventsLocalFailure extends EventsState {
  final ApiErrorModel error;

  AllEventsLocalFailure(this.error);
}

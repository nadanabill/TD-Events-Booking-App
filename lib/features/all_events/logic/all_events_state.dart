part of 'all_events_cubit.dart';

sealed class AllEventsState {}

final class AllEventsInitial extends AllEventsState {}

final class AllEventsLoading extends AllEventsState {}

final class AllEventsSuccess extends AllEventsState {}

final class AllEventsFailure extends AllEventsState {
  final ApiErrorModel error;

  AllEventsFailure(this.error);
}

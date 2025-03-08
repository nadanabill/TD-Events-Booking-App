part of 'organizer_cubit.dart';

sealed class OrganizerState {}

final class OrganizerInitial extends OrganizerState {}

final class OrganizerLoading extends OrganizerState {}

final class OrganizerSuccess extends OrganizerState {
  final OrganizerModel organizer;

  OrganizerSuccess(this.organizer);
}

final class OrganizerFailure extends OrganizerState {
  final String error;

  OrganizerFailure(this.error);
}

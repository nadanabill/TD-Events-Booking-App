import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:td_events_booking/features/event/data/repo/event_details_repo.dart';

import '../data/models/event_details_model.dart';

part 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  final EventDetailsRepo _eventDetailsRepo;

  EventDetailsCubit(this._eventDetailsRepo) : super(EventDetailsInitial());

  Future<void> getEventDetails({required int eventId}) async {
    emit(EventDetailsLoading());
    final response = await _eventDetailsRepo.getEventDetails(eventId: eventId);
    response.when(
      success: (eventDetailsModel) {
        emit(EventDetailsSuccess(event: eventDetailsModel));
      },
      failure: (error) {
        emit(EventDetailsFailure(error: error.message!));
      },
    );
  }

  String eventFormattedDate(date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat("d MMMM , yyyy").format(dateTime);
  }

  String getEventDate(date) {
    DateTime dateTime = DateTime.parse(date).toLocal();

    DateTime endTime = dateTime.add(const Duration(hours: 1));

    return "${DateFormat("h:mm a").format(dateTime)} - ${DateFormat("h:mm a").format(endTime)}";
  }
}

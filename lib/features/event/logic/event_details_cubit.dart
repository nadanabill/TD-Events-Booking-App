import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:td_events_booking/core/helpers/event_local_store_helper.dart';
import 'package:td_events_booking/features/event/data/repo/event_details_repo.dart';

import '../../../core/models/event_model.dart';
import '../data/models/event_details_model.dart';

part 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  final EventDetailsRepo _eventDetailsRepo;

  EventDetailsCubit(this._eventDetailsRepo) : super(EventDetailsInitial());

  List<Event> localEvents = [];
  bool isSaved = false;
  EventDetailsModel? eventModel;

  Future<void> getEventDetails(
      {required int eventId, required bool saved}) async {
    emit(EventDetailsLoading());
    final response = await _eventDetailsRepo.getEventDetails(eventId: eventId);
    isSaved = saved;
    response.when(
      success: (eventDetailsModel) async {
        eventModel = eventDetailsModel;
        emit(EventDetailsSuccess(event: eventDetailsModel));
      },
      failure: (error) {
        emit(EventDetailsFailure(error: error.message!));
      },
    );
  }

  void saveEvent(Event event) async {
    if (!isSaved) {
      isSaved = true;
      EventStorageHelper.saveEvent(
        event,
      );
    } else {
      isSaved = false;
      EventStorageHelper.removeEvent(event.eventId!);
    }
    emit(EventDetailsSuccess(event: eventModel!));
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

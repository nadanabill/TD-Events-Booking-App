import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/event_local_store_helper.dart';
import '../../../core/models/event_model.dart';
import '../../../core/networking/api_error_model.dart';

part 'local_events_state.dart';

class LocalEventsCubit extends Cubit<EventsState> {
  LocalEventsCubit() : super(EventsInitial());

  List<Event> events = [];

  void getSavedEvents() async {
    emit(AllEventsLocalLoading());
    List<Event> response = await EventStorageHelper.getSavedEvents();
    events = response;
    emit(AllEventsLocalSuccess());
  }

  void removeEvent(Event event) async {
    await EventStorageHelper.removeEvent(event.eventId!);
    events.removeWhere((element) => element.eventId == event.eventId);
    emit(AllEventsLocalSuccess());
  }
}

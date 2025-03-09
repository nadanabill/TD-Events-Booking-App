import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:td_events_booking/core/helpers/event_local_store_helper.dart';
import 'package:td_events_booking/core/networking/api_error_model.dart';
import 'package:td_events_booking/features/all_events/data/repo/all_events_repo.dart';

import '../../../core/models/event_model.dart';

part 'all_events_state.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  final AllEventsRepo _allEventsRepo;

  AllEventsCubit(this._allEventsRepo) : super(AllEventsInitial());

  int currentPage = 1;
  bool hasMorePages = true;
  bool isLoading = false;

  List<Event> allEventsList = [];
  Map<int, bool> allEventsMap = {};

  void getAllEvents() async {
    if (isLoading || !hasMorePages) return;
    isLoading = true;
    if (currentPage == 1) {
      emit(AllEventsLoading());
    }
    if (hasMorePages) {
      final response = await _allEventsRepo.getAllEvents(
        page: currentPage,
        limit: 5,
      );
      response.when(success: (allEventsModel) async {
        final newEvents = allEventsModel.data.events ?? [];

        if (newEvents.isNotEmpty) {
          allEventsList.addAll(newEvents);
          currentPage++;
          setAllEventsMap(newEvents);
        }
        hasMorePages = currentPage < allEventsModel.data.totalPages!;
        isLoading = false;
        emit(AllEventsSuccess());
      }, failure: (error) {
        isLoading = false;
        emit(AllEventsFailure(error));
      });
    }
  }

  void setAllEventsMap(List<Event> events) async {
    List<Event> localEvents = await EventStorageHelper.getSavedEvents();
    Set<int> eventsIds = localEvents.map((event) => event.eventId!).toSet();

    for (var event in events) {
      allEventsMap[event.eventId!] = eventsIds.contains(event.eventId!);
      print(allEventsMap[event.eventId!]);
    }
    print(allEventsMap);
  }

  void saveEvent(Event event) async {
    print(allEventsMap[event.eventId!]!);
    if (allEventsMap[event.eventId!] != null) {
      if (!allEventsMap[event.eventId!]!) {
        allEventsMap[event.eventId!] = true;
        EventStorageHelper.saveEvent(event);
      } else {
        allEventsMap[event.eventId!] = false;
        EventStorageHelper.removeEvent(event.eventId!);
      }
    }
    emit(AllEventsSuccess());
  }

  String eventFormattedDate(date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat("EEE, MMM d • h:mm a").format(dateTime);
  }

  String getEventDay(date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat("dd").format(dateTime);
  }

  String getEventMonth(date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat("MMM").format(dateTime);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:td_events_booking/core/networking/api_error_model.dart';
import 'package:td_events_booking/features/all_events/data/repo/all_events_repo.dart';

import '../data/models/all_events_model.dart';

part 'all_events_state.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  final AllEventsRepo _allEventsRepo;

  AllEventsCubit(this._allEventsRepo) : super(AllEventsInitial());

  int currentPage = 1;
  bool hasMorePages = true;
  bool isLoading = false;

  List<Events> allEventsList = [];

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
      response.when(success: (allEventsModel) {
        final newEvents = allEventsModel.data.events ?? [];

        if (newEvents.isNotEmpty) {
          allEventsList.addAll(newEvents);
          currentPage++;
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

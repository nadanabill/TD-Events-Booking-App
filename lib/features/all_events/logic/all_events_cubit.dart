import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:td_events_booking/core/networking/api_error_model.dart';
import 'package:td_events_booking/features/all_events/data/repo/all_events_repo.dart';

import '../data/models/all_events_model.dart';

part 'all_events_state.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  final AllEventsRepo _allEventsRepo;

  AllEventsCubit(this._allEventsRepo) : super(AllEventsInitial());

  List<Events> allEventsList = [];

  void getAllEvents({required int page, required int limit}) async {
    emit(AllEventsLoading());

    final response = await _allEventsRepo.getAllEvents(
      page: 1,
      limit: 10,
    );
    response.when(success: (allEventsModel) {
      allEventsList.addAll(allEventsModel.data.events ?? []);
      emit(AllEventsSuccess());
    }, failure: (error) {
      emit(AllEventsFailure(error));
    });
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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/organizer_model.dart';
import '../data/repo/organizer_repo.dart';

part 'organizer_state.dart';

class OrganizerCubit extends Cubit<OrganizerState> {
  final OrganizersRepo _organizersRepo;

  OrganizerCubit(this._organizersRepo) : super(OrganizerInitial());

  Future<void> getOrganizer({required int organizerId}) async {
    emit(OrganizerLoading());
    final response =
        await _organizersRepo.getOrganizer(organizerId: organizerId);
    response.when(success: (organizer) {
      emit(OrganizerSuccess(organizer));
    }, failure: (error) {
      emit(OrganizerFailure(error.message ?? 'Something went wrong'));
    });
  }

  String formatCustomDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    String day = dateTime.day.toString();
    String suffix = getDaySuffix(dateTime.day);
    String formattedDay = "$day$suffix";
    String weekday = DateFormat("EEE").format(dateTime);
    String month = DateFormat("MMM").format(dateTime);
    String time = DateFormat("h:mm a").format(dateTime);

    return "$formattedDay $month - $weekday - $time";
  }

  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return "th";
    }
    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date).toLocal();

    return DateFormat("dd MMM").format(dateTime);
  }
}

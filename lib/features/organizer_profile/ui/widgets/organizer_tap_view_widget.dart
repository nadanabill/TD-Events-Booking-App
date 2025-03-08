import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/data/models/organizer_model.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_about_body_widget.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_events_list.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_reviews_list_widget.dart';

class OrganizerTapViewWidget extends StatelessWidget {
  final TabController tabController;
  final OrganizerData organizer;

  const OrganizerTapViewWidget(
      {super.key, required this.tabController, required this.organizer});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      controller: tabController,
      children: [
        OrganizerAboutBodyWidget(
          about: organizer.about ?? '',
        ),
        OrganizerEventsList(
          events: organizer.events ?? [],
        ),
        OrganizerReviewsListWidget(
          reviews: organizer.reviews ?? [],
        ),
      ],
    );
  }
}

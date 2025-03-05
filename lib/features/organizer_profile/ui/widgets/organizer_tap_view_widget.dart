import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_about_body_widget.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_events_list.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_reviews_list_widget.dart';

class OrganizerTapViewWidget extends StatelessWidget {
  final TabController tabController;

  const OrganizerTapViewWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      controller: tabController,
      children: const [
        OrganizerAboutBodyWidget(
          about:
              'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. ',
        ),
        OrganizerEventsList(),
        OrganizerReviewsListWidget(),
      ],
    );
  }
}

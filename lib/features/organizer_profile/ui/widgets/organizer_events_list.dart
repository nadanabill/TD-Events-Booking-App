import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_events_item_widget.dart';

import '../../../../core/helpers/spaces.dart';

class OrganizerEventsList extends StatelessWidget {
  const OrganizerEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (context, index) => const OrganizerEventsItemWidget(),
      separatorBuilder: (context, index) => verticalSpace(16),
      itemCount: 5,
    );
  }
}

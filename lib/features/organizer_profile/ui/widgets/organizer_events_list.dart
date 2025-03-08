import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/data/models/organizer_model.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_events_item_widget.dart';

import '../../../../core/helpers/spaces.dart';

class OrganizerEventsList extends StatelessWidget {
  final List<OrganizerEvents> events;

  const OrganizerEventsList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (context, index) => OrganizerEventsItemWidget(
        event: events[index],
      ),
      separatorBuilder: (context, index) => verticalSpace(16),
      itemCount: events.length,
    );
  }
}

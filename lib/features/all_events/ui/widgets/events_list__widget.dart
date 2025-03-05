import 'package:flutter/material.dart';
import 'package:td_events_booking/features/all_events/ui/widgets/events_item_widget.dart';

import '../../../../core/helpers/spaces.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemBuilder: (context, index) => const EventsItemWidget(),
        separatorBuilder: (context, index) => verticalSpace(15),
        itemCount: 10,
      ),
    );
  }
}

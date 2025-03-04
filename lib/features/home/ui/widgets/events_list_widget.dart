import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/features/home/ui/widgets/event_item_widget.dart';

import '../../../../core/helpers/spaces.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        separatorBuilder: (context, index) => horizontalSpace(16),
        itemBuilder: (context, index) => const EventItemWidget(),
      ),
    );
  }
}

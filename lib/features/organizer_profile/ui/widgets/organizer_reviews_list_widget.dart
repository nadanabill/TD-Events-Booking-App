import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_review_item_widget.dart';

import '../../../../core/helpers/spaces.dart';

class OrganizerReviewsListWidget extends StatelessWidget {
  const OrganizerReviewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (context, index) => const OrganizerReviewItemWidget(),
      separatorBuilder: (context, index) => verticalSpace(16),
      itemCount: 5,
    );
  }
}

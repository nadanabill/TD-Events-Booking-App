import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_review_item_widget.dart';

import '../../../../core/helpers/spaces.dart';
import '../../data/models/organizer_model.dart';

class OrganizerReviewsListWidget extends StatelessWidget {
  final List<OrganizerReviews> reviews;

  const OrganizerReviewsListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (context, index) => OrganizerReviewItemWidget(
        review: reviews[index],
      ),
      separatorBuilder: (context, index) => verticalSpace(16),
      itemCount: reviews.length,
    );
  }
}

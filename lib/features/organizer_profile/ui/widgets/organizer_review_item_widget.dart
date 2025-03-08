import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:td_events_booking/features/organizer_profile/data/models/organizer_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../logic/organizer_cubit.dart';

class OrganizerReviewItemWidget extends StatelessWidget {
  final OrganizerReviews review;

  const OrganizerReviewItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(review.reviewerPicture ?? AppImages.user),
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.reviewerName ?? '',
                  style: AppTextStyles.font18Black500,
                ),
                verticalSpace(5),
                RatingBar.builder(
                  initialRating: review.rate!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  unratedColor: AppColors.grey2.withOpacity(0.7),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star_rounded,
                    color: AppColors.yellow,
                  ),
                  itemSize: 20,
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
                verticalSpace(5),
                Text(
                  review.review ?? '',
                  style: AppTextStyles.font15Black400,
                ),
              ],
            ),
          ),
          Text(
            context.read<OrganizerCubit>().formatDate(
                  review.reviewDate!,
                ),
            textAlign: TextAlign.right,
            style: AppTextStyles.font15Grey3400,
          ),
        ],
      ),
    );
  }
}

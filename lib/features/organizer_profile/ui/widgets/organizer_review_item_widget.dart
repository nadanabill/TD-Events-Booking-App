import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class OrganizerReviewItemWidget extends StatelessWidget {
  const OrganizerReviewItemWidget({super.key});

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
            decoration: const ShapeDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile1.png'),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rocks Velkeinjen',
                  style: AppTextStyles.font18Black500,
                ),
                verticalSpace(5),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  unratedColor: AppColors.white.withOpacity(0.7),
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
                  'Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.',
                  style: AppTextStyles.font15Black400,
                ),
              ],
            ),
          ),
          Text(
            '10 Feb',
            textAlign: TextAlign.right,
            style: AppTextStyles.font15Grey3400,
          ),
        ],
      ),
    );
  }
}

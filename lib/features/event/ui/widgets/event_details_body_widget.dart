import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import 'details_row_widget.dart';

class EventDetailsBodyWidget extends StatelessWidget {
  const EventDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'International Band Music Concert',
            style: AppTextStyles.font35Black400,
          ),
          verticalSpace(18),
          const DetailsRowWidget(
            title: '14 December, 2021',
            subtitle: 'Tuesday, 4:00PM - 9:00PM',
            icon: AppSvgs.date,
          ),
          verticalSpace(15),
          const DetailsRowWidget(
            title: 'Gala Convention Center',
            subtitle: '36 Guild Street London, UK ',
            icon: AppSvgs.location1,
          ),
          verticalSpace(24),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/event_cover.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              horizontalSpace(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ashfak Sayem',
                    style: AppTextStyles.font15Black400,
                  ),
                  Text(
                    'Organizer',
                    style: AppTextStyles.font12LightGray400,
                  )
                ],
              ),
              const Spacer(),
              Container(
                width: 67.w,
                height: 28.h,
                decoration: ShapeDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.r)),
                ),
                child: Center(
                  child: Text(
                    AppStrings.follow,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font12Primary400,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(20),
          Text(
            AppStrings.aboutEvent,
            style: AppTextStyles.font18Black500,
          ),
          verticalSpace(8),
          Text(
            'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
            style: AppTextStyles.font16Black400,
          ),
        ],
      ),
    );
  }
}

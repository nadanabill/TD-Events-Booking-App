import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237.w,
      height: 255.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey3.withOpacity(0.5),
            offset: const Offset(0, 8),
            blurRadius: 30,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/event_cover.png',
                height: 131.h,
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white.withOpacity(0.7),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: RichText(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '10',
                          style: AppTextStyles.font18Red700,
                        ),
                        TextSpan(
                          text: '\nJUNE',
                          style: AppTextStyles.font10Red400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white.withOpacity(0.7),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(AppSvgs.bookmark),
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Text(
            "International Band Music Festival",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font18Black500,
          ),
          verticalSpace(10),
          Row(
            children: [
              Container(
                width: 56.w,
                height: 24.h,
                color: AppColors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: AppColors.white,
                        child: Image.asset('assets/images/profile3.png'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 12.r,
                        child: Image.asset('assets/images/profile2.png'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: AppColors.white,
                        child: Image.asset('assets/images/profile1.png'),
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpace(10),
              Text(
                "+20 Going",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font12Primary500,
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              SvgPicture.asset(AppSvgs.mapPin),
              horizontalSpace(5),
              Text(
                "36 Guild Street London, UK ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font13Grey4400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

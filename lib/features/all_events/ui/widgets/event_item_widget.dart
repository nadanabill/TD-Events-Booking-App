import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey3.withOpacity(0.3),
            blurRadius: 35,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 9, bottom: 9, left: 9, right: 17),
      child: Row(
        children: [
          Container(
            width: 79.w,
            height: 92.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/event_cover.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          horizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wed, Apr 28 •5:30 PM',
                  style: AppTextStyles.font13Primary400,
                ),
                Text(
                  'Jo Malone London’s Mother’s Day Presents',
                  style: AppTextStyles.font14Black400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppSvgs.mapPin,
                    ),
                    horizontalSpace(4),
                    Expanded(
                      child: Text(
                        'Radius Gallery • Santa Cruz, CA',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font13LightGrey400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

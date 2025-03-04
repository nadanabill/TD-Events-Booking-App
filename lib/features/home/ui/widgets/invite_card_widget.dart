import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/themes/app_colors.dart';
import 'package:td_events_booking/core/themes/app_text_styles.dart';

class InviteCardWidget extends StatelessWidget {
  const InviteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 127.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightCyan,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey3.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 50,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: width * 0.65,
              ),
              child: Image.asset(
                AppImages.prize,
                height: 155.h,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.inviteYourFriends,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font18Black500,
                ),
                Text(
                  AppStrings.get20ForTicket,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font13BlueGrey400,
                ),
                verticalSpace(13),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cyan,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 5, left: 14, right: 20),
                  child: Text(
                    AppStrings.invite,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font12White400,
                  ),
                ),
                verticalSpace(18),
              ],
            ),
          )
        ],
      ),
    );
  }
}

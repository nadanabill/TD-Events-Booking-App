import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/features/organizer_profile/data/models/organizer_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/default_button_widget.dart';

class OrganizerProfileHeaderWidget extends StatelessWidget {
  final OrganizerData organizer;

  const OrganizerProfileHeaderWidget({super.key, required this.organizer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: NetworkImage(organizer.picture ?? AppImages.user),
        ),
        verticalSpace(20),
        Text(
          organizer.name ?? '',
          textAlign: TextAlign.center,
          style: AppTextStyles.font24Black500,
        ),
        verticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  organizer.numberOfFollowing.toString(),
                  style: AppTextStyles.font16Black500,
                ),
                Text(
                  AppStrings.following,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14LightGray400,
                ),
              ],
            ),
            Container(
              width: 1,
              height: 30.h,
              color: AppColors.lightGrey,
              margin: const EdgeInsets.symmetric(horizontal: 24),
            ),
            Column(
              children: [
                Text(
                  organizer.numberOfFollowers.toString(),
                  style: AppTextStyles.font16Black500,
                ),
                Text(
                  AppStrings.followers,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14LightGray400,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DefaultButtonWidget(
                hasPadding: false,
                borderRadius: 10.r,
                height: 50.h,
                text: '',
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppSvgs.userPlus),
                    horizontalSpace(10),
                    Text(
                      AppStrings.follow,
                      style: AppTextStyles.font16White400,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: DefaultButtonWidget(
                color: AppColors.white,
                hasPadding: false,
                height: 50.h,
                borderRadius: 10.r,
                text: '',
                hasSideBorder: true,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvgs.message,
                      color: AppColors.primary,
                    ),
                    horizontalSpace(10),
                    Text(
                      AppStrings.messages,
                      style: AppTextStyles.font16Primary400,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

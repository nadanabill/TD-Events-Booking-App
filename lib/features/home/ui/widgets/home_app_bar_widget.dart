import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/themes/app_text_styles.dart';
import 'package:td_events_booking/features/home/ui/layout.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/themes/app_colors.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  drawerController.toggle?.call();
                },
                icon: SvgPicture.asset(
                  AppSvgs.menu,
                  width: 24.w,
                  height: 20.h,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.currentLocation,
                        style: AppTextStyles.font12White400.copyWith(
                          color: AppColors.white.withOpacity(0.7),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  Text(
                    'New Yourk, USA',
                    style: AppTextStyles.font13White500,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppSvgs.notifications,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            style: AppTextStyles.font15White400,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ' | Search...',
              hintStyle: AppTextStyles.font20White400.copyWith(
                color: AppColors.white.withOpacity(0.3),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  AppSvgs.search,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 75,
                minHeight: 32,
              ),
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppSvgs.filter),
                      horizontalSpace(4),
                      Text(
                        AppStrings.filters,
                        style: AppTextStyles.font12Primary400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

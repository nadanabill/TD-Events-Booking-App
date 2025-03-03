import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingBottomWidget extends StatelessWidget {
  final PageController pageController;

  const OnboardingBottomWidget({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(48.r),
          topLeft: Radius.circular(48.r),
        ),
        color: AppColors.primary,
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: onboardingData
                  .map((e) => Column(
                        children: [
                          Text(
                            e.title,
                            style: AppTextStyles.font22White500,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            e.description,
                            style: AppTextStyles.font15White400.copyWith(
                              color: AppColors.white.withOpacity(0.8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  style: AppTextStyles.font18White500.copyWith(
                    color: AppColors.white.withOpacity(0.5),
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: onboardingData.length,
                effect: WormEffect(
                  activeDotColor: AppColors.white,
                  dotColor: AppColors.white.withOpacity(0.2),
                  dotHeight: 8,
                  dotWidth: 8,
                  type: WormType.thinUnderground,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (pageController.page! < 2) {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
                child: Text(
                  AppStrings.next,
                  style: AppTextStyles.font18White500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

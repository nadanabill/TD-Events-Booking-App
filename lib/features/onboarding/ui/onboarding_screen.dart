import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/routing/routes.dart';
import 'package:td_events_booking/features/onboarding/data/models/onboarding_model.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.asset(AppImages.onboardingBackground,
                    fit: BoxFit.fitWidth)),
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Image.asset(
                            onboardingData[index].image,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  verticalSpace(20),
                                  Text(
                                    onboardingData[index].title,
                                    style: AppTextStyles.font20White500,
                                    textAlign: TextAlign.center,
                                  ),
                                  verticalSpace(5),
                                  Text(
                                    onboardingData[index].description,
                                    style:
                                        AppTextStyles.font15White400.copyWith(
                                      color: AppColors.white.withOpacity(0.8),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    itemCount: onboardingData.length,
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.loginScreen,
                            (route) => false,
                          );
                        },
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
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.loginScreen, (route) => false);
                          }
                        },
                        child: Text(
                          AppStrings.next,
                          style: AppTextStyles.font18White500,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(10)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

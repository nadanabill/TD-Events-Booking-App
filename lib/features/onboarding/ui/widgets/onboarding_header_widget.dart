import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../data/models/onboarding_model.dart';

class OnboardingHeaderWidget extends StatelessWidget {
  final PageController pageController;
  const OnboardingHeaderWidget({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.white,
      child: PageView(
        controller: pageController,
        children: onboardingData
            .map(
              (e) => Image.asset(
            e.image,
          ),
        )
            .toList(),
      ),
    );
  }
}

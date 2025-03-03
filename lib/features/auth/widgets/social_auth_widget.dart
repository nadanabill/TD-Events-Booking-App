import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../core/widgets/default_button_widget.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        Text(
          AppStrings.or,
          style: AppTextStyles.font16Grey2500,
        ),
        verticalSpace(10),
        DefaultButtonWidget(
          color: AppColors.white,
          text: '',
          onPressed: () {},
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.google),
              horizontalSpace(10),
              Text(
                AppStrings.loginWithGoogle,
                style: AppTextStyles.font16Black400,
              )
            ],
          ),
        ),
        verticalSpace(15),
        DefaultButtonWidget(
          color: AppColors.white,
          text: '',
          onPressed: () {},
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.facebook),
              horizontalSpace(10),
              Text(
                AppStrings.loginWithFacebook,
                style: AppTextStyles.font16Black400,
              )
            ],
          ),
        ),
      ],
    );
  }
}

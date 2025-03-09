import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';

class RememberForgetWidget extends StatefulWidget {
  const RememberForgetWidget({super.key});

  @override
  State<RememberForgetWidget> createState() => _RememberForgetWidgetState();
}

class _RememberForgetWidgetState extends State<RememberForgetWidget> {
  bool rememberMe = true;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: FittedBox(
            child: Switch(
                inactiveThumbColor: AppColors.primary,
                inactiveTrackColor: AppColors.white,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primary,
                value: rememberMe,
                onChanged: (value) {
                  rememberMe = !rememberMe;
                  setState(() {});
                }),
          ),
        ),
        Text(
          AppStrings.rememberMe,
          style: AppTextStyles.font14Black400,
        ),
        const Spacer(),
        FittedBox(
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.forgotPassword,
              style: AppTextStyles.font14Black400,
            ),
          ),
        ),
      ],
    );
  }
}

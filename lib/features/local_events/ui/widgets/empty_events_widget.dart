import 'package:flutter/material.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class EmptyEventsWidget extends StatelessWidget {
  const EmptyEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.calendar_month_rounded,
            size: 50,
            color: AppColors.grey2,

          ),
          verticalSpace(10),
          Text(
            'No Events saved',
            textAlign: TextAlign.center,
            style: AppTextStyles.font18Primary500,
          ),
        ],
      ),
    );

  }
}

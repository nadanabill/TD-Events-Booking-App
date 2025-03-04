import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_text_styles.dart';

class TextRowWidget extends StatelessWidget {
  final String text;

  const TextRowWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.font18Black500,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  AppStrings.seeAll,
                  style: AppTextStyles.font14LightGray400,
                ),
                horizontalSpace(5),
                SvgPicture.asset(AppSvgs.arrow),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

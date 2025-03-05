import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_text_styles.dart';

class DetailsRowWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;

  const DetailsRowWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
        ),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             title,
              style: AppTextStyles.font16Black400,
            ),
            Text(
              subtitle,
              style: AppTextStyles.font12LightGray400,
            )
          ],
        ),
      ],
    );
  }
}

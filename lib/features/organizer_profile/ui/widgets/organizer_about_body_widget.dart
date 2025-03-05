import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';

import '../../../../core/themes/app_text_styles.dart';

class OrganizerAboutBodyWidget extends StatelessWidget {
  final String about;

  const OrganizerAboutBodyWidget({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: about,
              style: AppTextStyles.font16Black400,
            ),
            TextSpan(
              text: AppStrings.readMore,
              style: AppTextStyles.font16Primary400,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}

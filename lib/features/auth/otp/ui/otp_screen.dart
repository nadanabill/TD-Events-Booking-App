import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/themes/app_colors.dart';
import 'package:td_events_booking/core/widgets/default_button_widget.dart';
import 'package:td_events_booking/features/auth/otp/ui/widgets/otp_resend_widget.dart';

import '../../../../core/themes/app_text_styles.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  final String pin = '0000';

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.verification,
                    style: AppTextStyles.font24Black500,
                  ),
                  verticalSpace(5),
                  Text(
                    '${AppStrings.codeSentText} +1 2620 0323 7631',
                    style: AppTextStyles.font15Black400,
                  ),
                  verticalSpace(70),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 55.h,
                      fieldWidth: 55.w,
                      activeColor: AppColors.primary,
                      selectedColor: AppColors.primary,
                      inactiveColor: AppColors.grey3,
                    ),
                    onCompleted: (value) {
                      if (otpController.text == pin) {}
                    },
                  ),
                  verticalSpace(20),
                  DefaultButtonWidget(
                    text: AppStrings.continueText,
                    onPressed: () {
                      if (otpController.text == pin) {}
                    },
                  ),
                  verticalSpace(20),
                  const OtpResendWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

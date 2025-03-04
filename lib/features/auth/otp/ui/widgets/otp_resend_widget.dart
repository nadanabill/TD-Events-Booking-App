import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/themes/app_text_styles.dart';

class OtpResendWidget extends StatefulWidget {
  const OtpResendWidget({super.key});

  @override
  State<OtpResendWidget> createState() => _OtpReSendWidgetState();
}

class _OtpReSendWidgetState extends State<OtpResendWidget> {
  int resendTime = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTime > 0) {
        setState(() {
          resendTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: resendTime > 0
          ? Text.rich(
              TextSpan(
                text: AppStrings.resendCodeIn,
                style: AppTextStyles.font15Black400,
                children: [
                  TextSpan(
                    text: '0:$resendTime',
                    style: AppTextStyles.font15Primary400,
                  ),
                ],
              ),
            )
          : TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.resendCode,
                style: AppTextStyles.font15Primary400,
              ),
            ),
    );
  }
}

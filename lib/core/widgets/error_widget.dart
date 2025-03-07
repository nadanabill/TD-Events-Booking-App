import 'package:flutter/material.dart';

import '../helpers/spaces.dart';
import '../themes/app_text_styles.dart';

class ErrorTextWidget extends StatelessWidget {
  final String error;

  const ErrorTextWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 40,
            color: Colors.red,
          ),
          verticalSpace(10),
          Text(
            error,
            style: AppTextStyles.font18Red500,
          ),
        ],
      ),
    );
  }
}

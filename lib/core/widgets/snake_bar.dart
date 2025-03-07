import 'package:flutter/material.dart';

import '../themes/app_text_styles.dart';

void showSnakeBar(
  BuildContext context, {
  required String message,
  required bool error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.font16White400,
      ),
      backgroundColor: error ? Colors.red : Colors.green,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

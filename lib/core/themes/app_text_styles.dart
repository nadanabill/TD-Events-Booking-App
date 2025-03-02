import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'AirbnbCereal';

  static TextStyle font20Primary600 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: fontFamily,
  );
}

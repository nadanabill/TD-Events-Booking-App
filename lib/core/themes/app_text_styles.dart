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
  static TextStyle font22White500 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: fontFamily,
  );
  static TextStyle font15White400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontFamily: fontFamily,
  );
  static TextStyle font18White500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: fontFamily,
  );
}

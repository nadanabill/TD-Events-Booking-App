import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? widget;
  final double? width;
  final double? height;
  final Color? color;
  final bool hasSideBorder;
  final bool hasPadding;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? elevation;

  const DefaultButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.widget,
    this.hasSideBorder = false,
    this.hasPadding = true,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 58.h,
      width: width ?? double.infinity,
      padding: hasPadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
            side: hasSideBorder
                ? BorderSide(
                    width: borderWidth ?? 2,
                    color: borderColor ?? AppColors.primary,
                  )
                : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: widget ??
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Center(
                  child: Text(
                    text.toUpperCase(),
                    style: AppTextStyles.font16White400,
                  ),
                ),
                Image.asset(AppImages.buttonArrow),
              ],
            ),
      ),
    );
  }
}

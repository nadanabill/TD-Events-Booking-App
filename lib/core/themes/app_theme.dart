import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        elevation: 0.0,
        shadowColor: AppColors.white,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.white,
    );

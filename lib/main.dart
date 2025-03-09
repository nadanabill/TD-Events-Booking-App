import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/core/di/dependency_injection.dart';
import 'app.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/notification_service.dart';
import 'core/routing/app_router.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await NotificationService().init();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => App(
        appRouter: AppRouter(),
      ), // Wrap your app
    ),
  );
}

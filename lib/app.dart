import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:td_events_booking/core/connection_cubit/internet__cubit.dart';
import 'package:td_events_booking/core/di/dependency_injection.dart';

import 'core/constants/app_strings.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/app_theme.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;

  const App({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, widget) {
          return BlocProvider(
            create: (context) => getIt<InternetCubit>(),
            child: MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              initialRoute: Routes.splashScreen,
              onGenerateRoute: appRouter.generateRoute,
            ),
          );
        });
  }
}

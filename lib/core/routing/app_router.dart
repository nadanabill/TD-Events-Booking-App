import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/features/all_events/ui/all_events_screen.dart';
import 'package:td_events_booking/features/auth/login/ui/login_screen.dart';
import 'package:td_events_booking/features/auth/otp/ui/otp_screen.dart';
import 'package:td_events_booking/features/auth/register/logic/register_cubit.dart';
import 'package:td_events_booking/features/auth/register/ui/register_screen.dart';
import 'package:td_events_booking/features/event/ui/event_details_screen.dart';
import 'package:td_events_booking/features/home/ui/layout.dart';
import 'package:td_events_booking/features/onboarding/ui/onboarding_screen.dart';
import 'package:td_events_booking/features/organizer_profile/ui/organizer_profile_screen.dart';

import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => getIt<RegisterCubit>(),
              child: const RegisterScreen()),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const Layout());
      case Routes.eventDetailsScreen:
        return MaterialPageRoute(builder: (_) => const EventDetailsScreen());
      case Routes.allEventsScreen:
        return MaterialPageRoute(builder: (_) => const AllEventsScreen());
      case Routes.organizerProfileScreen:
        return MaterialPageRoute(
            builder: (_) => const OrganizerProfileScreen());

      default:
        return null;
    }
  }
}

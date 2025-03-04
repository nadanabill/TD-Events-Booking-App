import 'package:flutter/material.dart';
import 'package:td_events_booking/features/auth/login/ui/login_screen.dart';
import 'package:td_events_booking/features/auth/otp/ui/otp_screen.dart';
import 'package:td_events_booking/features/auth/register/ui/register_screen.dart';
import 'package:td_events_booking/features/onboarding/ui/onboarding_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      default:
        return null;
    }
  }
}

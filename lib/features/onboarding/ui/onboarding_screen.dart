import 'package:flutter/material.dart';
import 'package:td_events_booking/features/onboarding/ui/widgets/onboarding_bottom_widget.dart';
import 'package:td_events_booking/features/onboarding/ui/widgets/onboarding_header_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: OnboardingHeaderWidget(pageController: pageController),
            ),
            Expanded(
              flex: 3,
              child: OnboardingBottomWidget(pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}

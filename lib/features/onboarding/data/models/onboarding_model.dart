class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/onboarding1.png',
    title: 'Explore Upcoming and Nearby Events',
    description:
        'In publishing and graphic design, Lorem is a placeholder text commonly',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding2.png',
    title: ' Web Have Modern Events Calendar Feature',
    description:
        'In publishing and graphic design, Lorem is a placeholder text commonly',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding1.png',
    title: 'To Look Up More Events or Activities Nearby By Map',
    description:
        'In publishing and graphic design, Lorem is a placeholder text commonly',
  ),
];

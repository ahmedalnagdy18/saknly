class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/onboarding1.png',
    title: 'Smart Location-Based Search',
    subTitle: 'Easily find homes and units close to your chosen location',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding2.png',
    title: 'Find Your Perfect Home',
    subTitle:
        'Make your buying journey easier and get the keys to your dream property',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding3.png',
    title: 'Everything You Need in App',
    subTitle: 'Manage and monitor your real estate activity effortlessly',
  ),
];

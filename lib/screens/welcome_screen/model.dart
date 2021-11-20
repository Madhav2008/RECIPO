class OnboardingModel {
  final String imageAsset;
  final String title;
  final String description;

  OnboardingModel(
      { this.description,
        this.imageAsset,
        this.title});
}

List<OnboardingModel> onboardong = <OnboardingModel>[
  OnboardingModel(
    description: '''Search for any Recipe you want. Follow and like your favourite recipe makers''',
    imageAsset: 'assets/images/Register.png',
    title: 'Browse and find any recipe you are looking',
  ),
  OnboardingModel(
    description: '''Save all your favourite recipes and get it later locally''',
    imageAsset: 'assets/images/Login.png',
    title: 'Book mark and save your favourite recipes',
  ),
  OnboardingModel(
    description: '''Post your own recipes as well''',
    imageAsset: 'assets/images/Welcome.png',
    title: 'Get likes on your own recipes',
  ),
];
class OnboardModel {
  String image;
  String title;
  String description;
  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardModel> models = [
  OnboardModel(
      image: "assets/images/medical_research.png",
      title: "Symptoms of Covid-19",
      description:
          "COVİD-19 different people in different ways. Most infected people will develop mild to moderate illiness"),
  OnboardModel(
      image: "assets/images/social_distancing.png",
      title: "Covid-19 Information",
      description:
          "Most people who fall sick with COVİD-19 will experience mild to moderate symptoms"),
  OnboardModel(
      image: "assets/images/wash_hands.png",
      title: "Just Stay at Home",
      description:
          "Stay at home self quarantine ourself from covid-19 hopefully everything gonna ben fine soon"),
];

class Project{
  final String? imagePath;
  final String title;
  final String description;

  Project({this.imagePath, required this.title, required this.description});
}

class Experience{
  final String title;
  final String organization;
  final String? observation;
  final DateTime startDate;
  final DateTime? endDate;

  Experience({required this.title, required this.organization, this.observation, required this.startDate, this.endDate});
}

class Curriculum {
  final String name;
  final String imagePath;
  final List<Experience> educationalExperiences;
  final List<Experience> professionalExperiences;
  final List<Project> projects;

  Curriculum({
    required this.name,
    required this.imagePath,
    required this.educationalExperiences,
    required this.professionalExperiences,
    required this.projects,
  });
}
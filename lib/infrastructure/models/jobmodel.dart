class JobModel {
  final String title;
  final String description;
  final String requirements;
  final String location;
  final String employmentType;
  final String salary;
  final List<String> skills;
  final String experienceLevel;
  final String educationLevel;
  final String deadline;

  JobModel(
      {required this.title,
      required this.description,
      required this.requirements,
      required this.location,
      required this.employmentType,
      required this.salary,
      required this.skills,
      required this.experienceLevel,
      required this.educationLevel,
      required this.deadline});
  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "requirements": requirements,
        "location": location,
        "employment_type": employmentType,
        "salary": salary,
        "skills_required": skills,
        "experience_level": experienceLevel,
        "education_level": educationLevel,
        "application_deadline": deadline
      };
}

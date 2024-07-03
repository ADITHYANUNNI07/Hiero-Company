import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/presentation/job/add%20job/function/fun_add_job.dart';

class JobModel {
  final String? id;
  final String title;
  final String type;
  final String description;
  final String requirements;
  final String location;
  final String employmentType;
  final String salary;
  final List<String> skills;
  final String experienceLevel;
  final String educationLevel;
  final String deadline;
  final String? companyName;
  final String yearOfExperience;
  final String opportunities;
  final String? candidateshired;
  final String startingDate;
  final String? companyImageUrl;
  JobModel({
    this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.requirements,
    required this.location,
    required this.employmentType,
    required this.salary,
    required this.skills,
    required this.experienceLevel,
    required this.educationLevel,
    required this.deadline,
    this.companyName,
    required this.yearOfExperience,
    required this.opportunities,
    this.candidateshired,
    required this.startingDate,
    this.companyImageUrl,
  });
  Map<String, String> toJson() => {
        "title": title,
        "type": type,
        "description": description,
        "requirements": requirements,
        "location": location,
        "employment_type": employmentType,
        "salary": salary,
        "skills_required": skills.toString(),
        "starting_date": convertDateTimeString(startingDate),
        "experience_level": experienceLevel,
        "education_level": educationLevel,
        "application_deadline": convertDateTimeString(deadline),
        "company_name": companyName ?? '',
        "year_of_experience": yearOfExperience,
        "opportunities": opportunities,
        "candidates_hired": '',
        "company_image_url": companyImageUrl ?? ''
      };
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      description: json['description'] ?? '',
      requirements: json['requirements'] ?? '',
      location: json['location'] ?? '',
      employmentType: json['employment_type'] ?? '',
      salary: json['salary'] ?? '',
      skills: List<String>.from(json['skills_required'] ?? []),
      experienceLevel: json['experience_level'] ?? '',
      educationLevel: json['education_level'] ?? '',
      deadline: json['application_deadline'] ?? '',
      companyName: json['company_name'],
      yearOfExperience: json['year_of_experience'] ?? '',
      opportunities: json['opportunities'] ?? '',
      candidateshired: json['candidates_hired'],
      startingDate: json['starting_date'] ?? '',
      companyImageUrl: json['company_image_url'],
    );
  }
}

JobModel jobModel = JobModel(
    title: 'Community Management',
    companyName: 'Finari Services Private Limited',
    companyImageUrl: AppImage.companyPic,
    type: 'Job',
    description:
        '1. Handle B2B customer communication\n2. Talking to existing/new customers and getting leads from them\n3. Conduct website user demos\n4. Making sure that the daily reports to clients go out on time\n5. Reporting directly to the head of marketing and sales\n6. Give feedback and manage quality of content creation teams to meet client standards\n7. Understand our services through Data Entry process in each department',
    requirements: 'requirements',
    location: 'Kochi',
    employmentType: 'Work from home',
    salary: '₹ 3 - 5 L',
    skills: [
      'Effective Communication',
      'Sales',
      'English Proficiency (Written)'
    ],
    experienceLevel: 'Advance-level',
    educationLevel: 'BCA Computer Science',
    deadline: '21 Sept 2024',
    candidateshired: '5',
    opportunities: '28',
    startingDate: 'Immediately',
    yearOfExperience: '1-5');

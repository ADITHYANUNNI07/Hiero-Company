class CompanyModel {
  final String? id;
  final String? companyName;
  final String? industry;
  final String? companySize;
  final String? website;
  final String? address;
  final String email;
  final String? phone;
  final String? password;
  final String? about;

  CompanyModel(
      {this.id,
      this.password,
      this.companyName,
      this.industry,
      this.companySize,
      this.website,
      this.address,
      required this.email,
      this.phone,
      this.about});
  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "industry": industry,
        "company_size": int.parse(companySize!),
        "website": website,
        "headquarters_address": address,
        "about_company": about,
        "contact_email": email,
        "contact_phone_number": int.parse(phone!),
        "password": password,
      };
  Map<String, dynamic> logintoJson() => {
        "email": email,
        "password": password,
      };
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      companyName: json['company_name'],
      industry: json['industry'],
      companySize: json['company_size'],
      website: json['website'],
      address: json['headquarters_address'],
      email: json['contact_email'],
      phone: json['contact_phone_number']?.toString(),
      about: json['about_company'],
    );
  }
}

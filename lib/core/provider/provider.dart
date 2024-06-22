// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hiero_company/core/widgets/widget.dart';

class SignUpProviderModel with ChangeNotifier {
  bool? _isFirstNameValid;
  bool? _isEmailValid;
  bool? _isPasswordValid;
  bool? _isPhoneValid;
  bool? _isAddressValid;
  bool? _isDOBValid;
  bool? _isBioValid;
  bool? _isIndustry;
  bool? _companySize;
  bool? _isWebsiteValid;
  bool? _islocation;
  bool? _isabout;
  bool? _isEducationLevel;
  double _selectedSalary = 0.0;
  String _experienceLevel = 'Entery-level';
  String _jobOrIntern = 'Job';
  bool _isJob = true;
  bool? get isFirstNameValid => _isFirstNameValid;
  bool? get isEmailValid => _isEmailValid;
  bool? get isPasswordValid => _isPasswordValid;
  bool? get isPhoneNumberValid => _isPhoneValid;
  bool? get isAddressValid => _isAddressValid;
  bool? get isDOBvalid => _isDOBValid;
  bool? get isBioValid => _isBioValid;
  bool? get companySize => _companySize;
  bool? get isIndustry => _isIndustry;
  bool? get isWebsiteValid => _isWebsiteValid;
  bool? get islocation => _islocation;
  bool? get isabout => _isabout;
  bool? get isEducationLevel => _isEducationLevel;
  String get experienceLevel => _experienceLevel;
  String get jobOrIntern => _jobOrIntern;
  bool get isJob => _isJob;
  void setJoborIntern(String jobOrIntern) {
    _jobOrIntern = jobOrIntern;
    jobOrIntern == 'Job' ? _isJob = true : _isJob = false;
    notifyListeners();
  }

  void setexperienceLevel(String experienceLevel) {
    _experienceLevel = experienceLevel;
    notifyListeners();
  }

  String _selectedJobType = 'Work from home';

  String get selectedJobTypes => _selectedJobType;

  void setSelectedJobTypes(String jobType) {
    _selectedJobType = jobType;
    notifyListeners();
  }

  double get selectedSalary => _selectedSalary;

  void setSelectedSalary(double salary) {
    _selectedSalary = salary;
    notifyListeners();
  }

  void validateLocation(String location) {
    if (location.isNotEmpty &&
        !location.contains(RegExp(r'[0-9]')) &&
        !location.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
        location.length > 3) {
      _islocation = true;
    } else {
      _islocation = false;
    }
    notifyListeners();
  }

  void validateFirstName(String firstName) {
    if (firstName.isNotEmpty &&
        !firstName.contains(RegExp(r'[0-9]')) &&
        !firstName.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
        firstName.length > 3) {
      _isFirstNameValid = true;
    } else {
      _isFirstNameValid = false;
    }
    notifyListeners();
  }

  void validateEducationQualification(String qualification) {
    if (qualification.isNotEmpty &&
        !qualification.contains(RegExp(r'[0-9]')) &&
        !qualification.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
        qualification.length > 1) {
      _isEducationLevel = true;
    } else {
      _isEducationLevel = false;
    }
    notifyListeners();
  }

  void validateIndustry(String industry) {
    if (industry.isNotEmpty &&
        !industry.contains(RegExp(r'[0-9]')) &&
        !industry.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
        industry.length > 4) {
      _isIndustry = true;
    } else {
      _isIndustry = false;
    }
    notifyListeners();
  }

  List<String> getIndustrySuggestions(String query) {
    List<String> industries = [
      "Advertising Industry",
      "Aerospace",
      "Agriculture and Farming",
      "Antiques and Collectibles",
      "Art",
      "Automotive Industry",
      "Banking & Financial Services",
      "Biotechnology",
      "Building Materials and Supplies",
      "Business Services",
      "Chemical Industry",
      "Cleaning Products and Services",
      "Cloud Computing",
      "Computer Hardware",
      "Construction Industry",
      "Consulting",
      "Consumer Electronics",
      "Consumer Goods",
      "Consumer Healthcare",
      "Crafts",
      "Culture Industry",
      "Data Storage and Management",
      "Defense Industry",
      "Design Industry",
      "Ecommerce",
      "Education and Training",
      "Energy",
      "Entertainment Industry",
      "Environmental Services",
      "Events Industry",
      "Fabrics and Textiles",
      "Fashion Industry",
      "Food & Beverage",
      "Healthcare Industry",
      "Heavy Industry",
      "Hospitality",
      "Information Technology",
      "Insurance",
      "Jewelry",
      "Leisure and Recreation",
      "Logistics and Supply Chain",
      "Luxury Goods",
      "Machinery and Heavy Equipment",
      "Manufacturing",
      "Media",
      "Medical Devices and Supplies",
      "Mining",
      "Music Industry",
      "Personal Services",
      "Pet Care and Supplies",
      "Pharmaceutical Industry",
      "Photography",
      "Printing",
      "Professional Services",
      "Publishing",
      "Real Estate",
      "Restaurants and Food Services",
      "Retail",
      "Robotics",
      "Security",
      "Social Media Industry",
      "Software",
      "Video Game Industry"
    ];
    return industries.where((industry) {
      return industry.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void validateCompanySize(String companySize) {
    int? size = int.tryParse(companySize);

    if (size != null && size > 0 && size <= 10000) {
      _companySize = true;
    } else {
      _companySize = false;
    }
    notifyListeners();
  }

  void validateWebsite(String website) {
    final RegExp urlRegExp = RegExp(r'^(https?:\/\/)?'
        r'((([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,})|'
        r'localhost|'
        r'(\d{1,3}\.){3}\d{1,3})'
        r'(:\d+)?(\/[-a-zA-Z0-9@:%._\+~#=]*)*'
        r'(\?[;&a-zA-Z0-9%_.~+=-]*)?'
        r'(\#[-a-zA-Z0-9_]*)?$');

    if (urlRegExp.hasMatch(website)) {
      _isWebsiteValid = true;
    } else {
      _isWebsiteValid = false;
    }
    notifyListeners();
  }

  void validateEmail(String email) {
    _isEmailValid = EmailValidator.validate(email.trim());
    notifyListeners();
  }

  void validatePassword(String password) {
    _isPasswordValid =
        RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password.trim());
    notifyListeners();
  }

  void validatePhoneNumber(String phoneNumber) {
    RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');

    _isPhoneValid = phoneNumberRegex.hasMatch(phoneNumber.trim());
    notifyListeners();
  }

  void validateAddress(String address) {
    if (address.trim().length > 6 &&
        !address.contains(RegExp(r'[!@#\$%^&*()?":{}|<>]'))) {
      _isAddressValid = true;
    } else {
      _isAddressValid = false;
    }
    notifyListeners();
  }

  void validateDOB(String dob) {
    if (dob.isEmpty) {
      _isDOBValid = false;
    } else {
      _isDOBValid = true;
    }
    notifyListeners();
  }

  void validateBio(String bio) {
    if (bio.trim().length > 6 &&
        !bio.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
      _isBioValid = true;
    } else {
      _isBioValid = false;
    }
    notifyListeners();
  }

  void validateAbout(String about) {
    if (about.trim().length > 10 &&
        !about.contains(RegExp(r'[!@#\$%^&*()?":{}|<>]'))) {
      _isabout = true;
    } else {
      _isabout = false;
    }
    notifyListeners();
  }
}

enum Gender { Nil, Male, Female, Other }

class GenderProvider extends ChangeNotifier {
  Gender _selectedGender = Gender.Nil;

  Gender get selectedGender => _selectedGender;

  void setSelectedGender(Gender gender, TextEditingController controller) {
    _selectedGender = gender;
    controller.text = gender.toString();
    notifyListeners();
  }
}

class JobFilterProvider extends ChangeNotifier {
  bool workFromHome = false;
  bool location = false;
  bool hybrid = false;

  void setWorkFromHome(bool value) {
    workFromHome = value;
    notifyListeners();
  }

  void setLocation(bool value) {
    location = value;
    notifyListeners();
  }

  void setHybrid(bool value) {
    hybrid = value;
    notifyListeners();
  }
}

class LocationService with ChangeNotifier {
  String _currentCity = '';

  String get currentCity => _currentCity;

  Future<void> getCurrentLocationCity() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      _currentCity = placemark.locality ?? '';
      locationController.text = currentCity;
      notifyListeners();
    }
  }
}

class SkillProvider with ChangeNotifier {
  List<String> _skills = [];

  List<String> get skills => _skills;

  void addSkill(String skill) {
    if (!_skills.contains(skill) && skill.isNotEmpty) {
      _skills.add(skill);
      notifyListeners();
    }
  }

  void removeSkill(String skill) {
    _skills.remove(skill);
    notifyListeners();
  }
}

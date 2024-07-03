import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/core/provider/provider.dart';
import 'package:hiero_company/presentation/signup/signup_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TextFieldClass {
  Widget buildCompanymailField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        label: 'Company Mail',
        icon: Icons.email,
        suffixicon: model.isEmailValid == null
            ? null
            : model.isEmailValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isEmailValid == null
            ? null
            : model.isEmailValid == false
                ? Colors.red
                : Colors.green,
        onChanged: (value) => model.validateEmail(value!),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return 'Please Enter the Company Mail';
          } else if (EmailValidator.validate(value)) {
            return null;
          } else {
            return 'Company Mail is Not valid';
          }
        },
      ),
    );
  }

  Widget buildPasswordField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        label: 'Password',
        icon: Icons.fingerprint,
        suffixicon: model.isPasswordValid == null
            ? null
            : model.isPasswordValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isPasswordValid == null
            ? null
            : model.isPasswordValid == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. Example@123",
        validator: (value) {
          if (RegExp(
                  r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(value!.trim())) {
            return null;
          } else if (value.isEmpty) {
            return 'Please Enter the password';
          } else {
            return 'Please Enter the Strong password';
          }
        },
        onChanged: (value) => model.validatePassword(value!),
      ),
    );
  }

  Widget buildCompanyNameField(
      BuildContext context, TextEditingController profileNameController) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: profileNameController,
        label: 'Company Name',
        icon: FontAwesomeIcons.building,
        suffixicon: model.isFirstNameValid == null
            ? null
            : model.isFirstNameValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isFirstNameValid == null
            ? null
            : model.isFirstNameValid == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. Vista Private Limited",
        onChanged: (value) => model.validateFirstName(value!),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter the Company Name';
          } else if (value.isNotEmpty &&
              !value.contains(RegExp(r'[0-9]')) &&
              !value.contains(RegExp(r'[!@#\$%^&*(),?":{}|<>]')) &&
              value.length > 3) {
            return null;
          } else {
            return 'Please Enter the valid Company Name';
          }
        },
      ),
    );
  }

  Widget buildContactNumberField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        keyboardType: TextInputType.phone,
        label: 'Contact Number',
        icon: Icons.phone,
        suffixicon: model.isPhoneNumberValid == null
            ? null
            : model.isPhoneNumberValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isPhoneNumberValid == null
            ? null
            : model.isPhoneNumberValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validatePhoneNumber(value!),
        validator: (value) {
          RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');

          if (phoneNumberRegex.hasMatch(value!.trim())) {
            return null;
          } else if (value.isEmpty) {
            return 'Please Enter the Contact No';
          } else {
            return 'Invalid Number';
          }
        },
      ),
    );
  }

  Widget buildAddressField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        maxLines: 8,
        label: 'Headquarters Address',
        controller: controller,
        icon: Icons.mark_as_unread_sharp,
        suffixicon: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateAddress(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*()?":{}|<>]'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter the address';
          } else {
            return 'Enter valid Address';
          }
        },
      ),
    );
  }

  Widget buildAboutField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        maxLines: 8,
        label: 'About',
        controller: controller,
        icon: Icons.mark_as_unread_sharp,
        suffixicon: model.isabout == null
            ? null
            : model.isabout == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isabout == null
            ? null
            : model.isabout == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateAbout(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*()?"{}|<>]'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter the About';
          } else {
            return 'Enter valid About';
          }
        },
      ),
    );
  }

  Widget buildProfileField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Profile',
        hintText: 'Eg. Marketing',
        icon: FontAwesomeIcons.chair,
        suffixicon: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateBio(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
            return null;
          } else {
            return 'Please Enter the valid Profile';
          }
        },
      ),
    );
  }

  Widget buildLocationField(
      BuildContext context, TextEditingController controller) {
    return Consumer<LocationService>(
      builder: (context, modellocation, child) => Consumer<SignUpProvider>(
        builder: (context, model, child) => TextFormWidget(
          controller:
              modellocation.currentCity.isEmpty ? controller : controller,
          label: 'Location',
          hintText: 'Eg. Delhi',
          widget: ElevatedBtnWidget(
            leading: const FaIcon(FontAwesomeIcons.locationCrosshairs,
                color: colorWhite),
            onPressed: () {
              modellocation.getCurrentLocationCity();
              locationEditingControllerNotifier.value.text =
                  modellocation.currentCity;
              print(locationEditingControllerNotifier.value);
            },
            title: 'Current Location',
            btnColor: colorApp,
          ),
          icon: FontAwesomeIcons.locationArrow,
          suffixicon: model.islocation == null
              ? null
              : model.islocation == false
                  ? Icons.cancel
                  : Icons.check_circle,
          suffixIconColor: model.islocation == null
              ? null
              : model.islocation == false
                  ? Colors.redAccent
                  : Colors.green,
          validator: (value) {
            if (value!.trim().length > 3 &&
                !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
              return null;
            } else {
              return 'Please Enter the valid location';
            }
          },
        ),
      ),
    );
  }

  Widget buildCompanySizeField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Company Size',
        hintText: 'Eg. 100',
        icon: FontAwesomeIcons.users,
        suffixicon: model.companySize == null
            ? null
            : model.companySize == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.companySize == null
            ? null
            : model.companySize == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateCompanySize(value!),
        validator: (value) {
          if (model.companySize == true) {
            return null;
          } else {
            return 'Please Enter the valid Company size';
          }
        },
      ),
    );
  }

  Widget buildIndustryField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox15H,
          const Text(
            'Industry',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          sizedBox10H,
          TypeAheadField<String>(
            suggestionsCallback: (search) => industries
                .where((industry) =>
                    industry.toLowerCase().contains(search.toLowerCase()))
                .toList(),
            textFieldConfiguration: TextFieldConfiguration(
              controller: industryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.industry),
                  ],
                ),
                labelText: 'Industry',
              ),
            ),
            itemBuilder: (context, industry) {
              return ListTile(
                title: Text(industry),
              );
            },
            onSuggestionSelected: (industry) {
              industryController.text = industry;
            },
          ),
        ],
      ),
    );
  }

  Widget buildWebsiteLinkField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Company Website',
        hintText: 'Eg. http://companydomain.co',
        icon: FontAwesomeIcons.firefoxBrowser,
        suffixicon: model.isWebsiteValid == null
            ? null
            : model.isWebsiteValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isWebsiteValid == null
            ? null
            : model.isWebsiteValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateWebsite(value!),
        validator: (value) {
          final RegExp urlRegExp = RegExp(r'^(https?:\/\/)?'
              r'((([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,})|'
              r'localhost|'
              r'(\d{1,3}\.){3}\d{1,3})'
              r'(:\d+)?(\/[-a-zA-Z0-9@:%._\+~#=]*)*'
              r'(\?[;&a-zA-Z0-9%_.~+=-]*)?'
              r'(\#[-a-zA-Z0-9_]*)?$');
          if (urlRegExp.hasMatch(value!)) {
            return null;
          } else {
            return 'Please Enter the valid company Website Link';
          }
        },
      ),
    );
  }

//=============================================ADD POST==============================================
  Widget buildProfileNameField(
      BuildContext context, TextEditingController profileNameController) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: profileNameController,
        label: 'Profile',
        icon: FontAwesomeIcons.building,
        suffixicon: model.isFirstNameValid == null
            ? null
            : model.isFirstNameValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isFirstNameValid == null
            ? null
            : model.isFirstNameValid == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. Flutter Developer",
        onChanged: (value) => model.validateFirstName(value!),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter the Job Title';
          } else if (value.trim().isNotEmpty &&
              !value.contains(RegExp(r'[0-9]')) &&
              !value.contains(RegExp(r'[!@#\$%^&*(),?":{}|<>]')) &&
              value.length > 3) {
            return null;
          } else {
            return 'Please Enter the valid  Job Title';
          }
        },
      ),
    );
  }

  final List<String> experienceLevel = [
    'Entery-level',
    'Intermediate-level',
    'Advance-level'
  ];
  Widget buildexperienceLevelField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, jobTypeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox15H,
            const Text(
              'Experience Level',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            sizedBox10H,
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  elevation: 0,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  value: jobTypeProvider.experienceLevel,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      jobTypeProvider.setexperienceLevel(newValue);
                      controller.text = newValue;
                    }
                  },
                  items: experienceLevel
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  final List<String> interOrJob = ['Job', 'Internship'];
  Widget buildJoborInternField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, jobTypeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox15H,
            const Text(
              'Profile Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            sizedBox10H,
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  elevation: 0,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  value: jobTypeProvider.jobOrIntern,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      jobTypeProvider.setJoborIntern(newValue);
                      controller.text = newValue;
                    }
                  },
                  items:
                      interOrJob.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildAboutCompanyField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        maxLines: 8,
        label: model.isJob ? 'Job Description' : 'Internship Description',
        controller: controller,
        icon: Icons.mark_as_unread_sharp,
        suffixicon: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateAddress(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*()?"{}|<>]'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter the Description';
          } else {
            return 'Enter valid Description';
          }
        },
      ),
    );
  }

  Widget buildRequirementField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        maxLines: 8,
        label: model.isJob ? 'Job Requirements' : 'Internship Requirements',
        controller: controller,
        icon: Icons.mark_as_unread_sharp,
        suffixicon: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isBioValid == null
            ? null
            : model.isBioValid == false
                ? Colors.redAccent
                : Colors.green,
        onChanged: (value) => model.validateBio(value!),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*()?"{}|<>]'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter the Requirements';
          } else {
            return 'Enter valid Requirements';
          }
        },
      ),
    );
  }

  Widget buildStartingDateField(
      BuildContext context, TextEditingController dateEditingConntroller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox15H,
          const Text(
            'Starting Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          sizedBox10H,
          TextFormField(
              initialValue: null,
              readOnly: true,
              controller: dateEditingConntroller,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: model.isDOBvalid == null
                    ? null
                    : model.isDOBvalid == false
                        ? const Icon(
                            Icons.cancel,
                            color: colorRed,
                          )
                        : const Icon(
                            Icons.check_circle,
                            color: colorGreen,
                          ),
                fillColor: colorWhite,
                prefixIcon: const Icon(Icons.calendar_month),
                labelText: 'Starting Date',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorApp,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  dateEditingConntroller.text =
                      DateFormat('dd MMM yyyy').format(date);
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Select Starting Date";
                } else {
                  return null;
                }
              },
              onChanged: (value) =>
                  model.validateDOB(dateEditingConntroller.text)),
        ],
      ),
    );
  }

  Widget buildDeadLineField(
      BuildContext context, TextEditingController dateEditingConntroller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox15H,
          const Text(
            'Application Deadline',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          sizedBox10H,
          TextFormField(
              initialValue: null,
              readOnly: true,
              controller: dateEditingConntroller,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: model.isDOBvalid == null
                    ? null
                    : model.isDOBvalid == false
                        ? const Icon(
                            Icons.cancel,
                            color: colorRed,
                          )
                        : const Icon(
                            Icons.check_circle,
                            color: colorGreen,
                          ),
                fillColor: colorWhite,
                prefixIcon: const Icon(Icons.calendar_month),
                labelText: 'Application Deadline',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorApp,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  dateEditingConntroller.text =
                      DateFormat('dd MMM yyyy').format(date);
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Select Application Deadline";
                } else {
                  return null;
                }
              },
              onChanged: (value) =>
                  model.validateDOB(dateEditingConntroller.text)),
        ],
      ),
    );
  }

  final List<String> jobTypes = ['Work from home', 'On-Site', 'Hybrid'];

  Widget buildJobTypeField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, jobTypeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text(
              jobTypeProvider.isJob ? 'Job Type' : 'Internship Type',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  elevation: 0,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  value: jobTypeProvider.selectedJobTypes,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      jobTypeProvider.setSelectedJobTypes(newValue);
                      controller.text = newValue;
                    }
                  },
                  items: jobTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildEducationQualificationField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Education Level',
        icon: FontAwesomeIcons.award,
        suffixicon: model.isEducationLevel == null
            ? null
            : model.isEducationLevel == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isEducationLevel == null
            ? null
            : model.isEducationLevel == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. BCA Computer Science",
        onChanged: (value) => model.validateEducationQualification(value!),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter the Education Level';
          } else if (value.trim().isNotEmpty &&
              !value.contains(RegExp(r'[0-9]')) &&
              !value.contains(RegExp(r'[!@#\$%^&*(),?":{}|<>]')) &&
              value.length > 3) {
            return null;
          } else {
            return 'Please Enter the valid Education Level';
          }
        },
      ),
    );
  }

  Widget buildSalaryField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: model.isJob ? 'Salary' : 'Stipend',
        icon: FontAwesomeIcons.moneyBill,
        hintText: model.isJob ? "Eg. 6L - 8L" : 'Eg. 6K - 8K',
        onChanged: (value) => model.validateEducationQualification(value!),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter the Salary';
          } else if (value.trim().isNotEmpty &&
              !value.contains(RegExp(r'[!@#\$%^&*(),?":{}|<>]')) &&
              value.length > 1) {
            return null;
          } else {
            return 'Please Enter the valid  Salary';
          }
        },
      ),
    );
  }

  Widget buildopportunitiesField(
      BuildContext context, TextEditingController opportunitiesController) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        keyboardType: TextInputType.number,
        controller: opportunitiesController,
        label: 'opportunities',
        icon: FontAwesomeIcons.chair,
        suffixicon: model.isopportunities == null
            ? null
            : model.isopportunities == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isopportunities == null
            ? null
            : model.isopportunities == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. 58",
        onChanged: (value) => model.validateOpportunities(value!),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter the opportunities';
          } else if (value.trim().isNotEmpty &&
              value.contains(RegExp(r'[0-9]')) &&
              !value.contains(RegExp(r'[!@#\$%^&*(),?":{}|<>]'))) {
            return null;
          } else {
            return 'Please Enter the valid  opportunities';
          }
        },
      ),
    );
  }

  Widget buildYearofExpField(
      BuildContext context, TextEditingController opportunitiesController) {
    return Consumer<SignUpProvider>(
      builder: (context, model, child) => TextFormWidget(
        keyboardType: TextInputType.number,
        controller: opportunitiesController,
        label: 'Year Of Experience',
        icon: FontAwesomeIcons.calendarDays,
        suffixicon: model.isyearofexp == null
            ? null
            : model.isyearofexp == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isyearofexp == null
            ? null
            : model.isyearofexp == false
                ? Colors.redAccent
                : Colors.green,
        hintText: "Eg. 2",
        onChanged: (value) => model.validateyearofexp(value!),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter the Year Of Experience';
          } else if (value.trim().isNotEmpty &&
              value.contains(RegExp(r'[0-9]')) &&
              !value.contains(RegExp(r'[!@#\$%^&*(),?":{}|<>]'))) {
            return null;
          } else {
            return 'Please Enter the valid  Year Of Experience';
          }
        },
      ),
    );
  }
}

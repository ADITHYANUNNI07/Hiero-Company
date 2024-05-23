import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_company/domain/core/colors/colors.dart';
import 'package:hiero_company/domain/core/constants/constants.dart';
import 'package:hiero_company/domain/core/widgets/widget.dart';
import 'package:hiero_company/domain/core/provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TextFieldClass {
  Widget buildCompanymailField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
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
    return Consumer<SignUpProviderModel>(
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
    return Consumer<SignUpProviderModel>(
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
    return Consumer<SignUpProviderModel>(
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
    return Consumer<SignUpProviderModel>(
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
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
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

  Widget buildProfileField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
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
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        controller: controller,
        label: 'Location',
        hintText: 'Eg. Delhi',
        icon: FontAwesomeIcons.locationArrow,
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

  //=============================================ADD POST==============================================
  Widget buildProfileNameField(
      BuildContext context, TextEditingController profileNameController) {
    return Consumer<SignUpProviderModel>(
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

  final List<String> internOrJob = ['Job', 'Internship'];
  Widget buildInternORJobField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, jobTypeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox15H,
            const Text(
              'Job/Internship',
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
                  value: jobTypeProvider.selectedJobOrIntern,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      jobTypeProvider.setSelectedJobOrIntern(newValue);
                      controller.text = newValue;
                    }
                  },
                  items:
                      internOrJob.map<DropdownMenuItem<String>>((String value) {
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
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormWidget(
        maxLines: 8,
        label: 'About Company',
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
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
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

  Widget buildStartingDateField(
      BuildContext context, TextEditingController dateEditingConntroller) {
    return Consumer<SignUpProviderModel>(
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
                    firstDate: DateTime(1900),
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

  final List<String> jobTypes = ['Work from home', 'On-Site', 'Hybrid'];

  Widget buildJobTypeField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, jobTypeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            const Text(
              'Job/Internship Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
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
}

import 'package:flutter/material.dart';
import 'package:hiero_company/core/notification/notification.dart';
import 'package:hiero_company/infrastructure/firebase/firebase_auth.dart';
import 'package:hiero_company/infrastructure/models/companymodels.dart';
import 'package:hiero_company/presentation/signup/signup_screen.dart';

signupFun(GlobalKey<FormState> signupformKey, BuildContext context) {
  if (signupformKey.currentState!.validate() &&
      industryController.text.isNotEmpty) {
    final companyModel = CompanyModel(
        password: passwordEditingController.text.trim(),
        companyName: companyNameEditingController.text.trim(),
        industry: industryController.text.trim(),
        companySize: companySizeConntroller.text.trim(),
        website: websiteController.text.trim(),
        address: addressEditingController.text.trim(),
        email: emailEditingController.text.trim(),
        phone: phoneNoEditingController.text.trim(),
        about: aboutEditingController.text.trim());
    AuthServiceClass().createUserAccount(companyModel, context);
  } else {
    NotificationClass.snakBarError('Please Select the Industry 🏭', context);
  }
}

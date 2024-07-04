import 'package:flutter/material.dart';
import 'package:hiero_company/infrastructure/firebase/firebase_auth.dart';
import 'package:hiero_company/infrastructure/models/companymodels.dart';
import 'package:hiero_company/presentation/signup/signup_screen.dart';

loginFun(GlobalKey<FormState> loginformKey, BuildContext context) {
  if (loginformKey.currentState!.validate()) {
    final companyModel = CompanyModel(
      password: passwordEditingController.text.trim(),
      email: emailEditingController.text.trim(),
    );
    AuthServiceClass().loginUserAccount(companyModel, context);
  }
}

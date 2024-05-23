import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiero_company/domain/core/colors/colors.dart';
import 'package:hiero_company/domain/core/constants/constants.dart';
import 'package:hiero_company/domain/core/provider/provider.dart';
import 'package:hiero_company/domain/core/widgets/textfields.dart';
import 'package:hiero_company/domain/core/widgets/widget.dart';
import 'package:hiero_company/presentation/login/login_screen.dart';
import 'package:hiero_company/presentation/signup/functions/fun_signup.dart';
import 'package:provider/provider.dart';

final TextEditingController companyNameEditingController =
    TextEditingController();
final TextEditingController secondNameEditingController =
    TextEditingController();
final TextEditingController emailEditingController = TextEditingController();
final TextEditingController passwordEditingController = TextEditingController();
final TextEditingController phoneNoEditingController = TextEditingController();
final TextEditingController addressEditingController = TextEditingController();
final TextEditingController locationEditingController = TextEditingController();
final TextEditingController dateEditingConntroller = TextEditingController();
final TextEditingController bioEditingController = TextEditingController();
final signupformKey = GlobalKey<FormState>();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TopColorSafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Form(
                key: signupformKey,
                child: Consumer<SignUpProviderModel>(
                  builder: (context, formPro, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Getting Started', style: mainTitle),
                        const Text('Create an account to continue!'),
                        sizedBox20H,
                        TextFieldClass().buildCompanyNameField(
                            context, companyNameEditingController),
                        TextFieldClass().buildCompanymailField(
                            context, emailEditingController),
                        TextFieldClass().buildPasswordField(
                            context, passwordEditingController),
                        TextFieldClass().buildContactNumberField(
                            context, phoneNoEditingController),
                        TextFieldClass().buildAddressField(
                            context, addressEditingController),
                        TextFieldClass().buildLocationField(
                            context, locationEditingController),
                        sizedBox10H,
                        ElevatedBtnWidget(
                          onPressed: () {
                            signupFun(signupformKey);
                          },
                          title: 'SIGNUP',
                          btnColor: colorApp,
                        ),
                        sizedBox25H,
                        Align(
                          child: InkWell(
                            onTap: () {
                              Get.off(() => LoginScreen());
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "Already have an Account?",
                                children: [
                                  TextSpan(
                                    text: ' Login',
                                    style: TextStyle(color: colorApp),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        sizedBox25H
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

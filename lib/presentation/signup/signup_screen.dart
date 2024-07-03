import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiero_company/application/auth/auth_bloc.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/notification/notification.dart';
import 'package:hiero_company/core/provider/provider.dart';
import 'package:hiero_company/core/widgets/textfields.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/presentation/dashboard/dashboard_screen.dart';
import 'package:hiero_company/presentation/login/login_screen.dart';
import 'package:hiero_company/presentation/signup/functions/fun_signup.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController companyNameEditingController =
    TextEditingController();
final TextEditingController secondNameEditingController =
    TextEditingController();
final TextEditingController emailEditingController = TextEditingController();
final TextEditingController passwordEditingController = TextEditingController();
final TextEditingController phoneNoEditingController = TextEditingController();
final TextEditingController addressEditingController = TextEditingController();
final ValueNotifier<TextEditingController> locationEditingControllerNotifier =
    ValueNotifier(TextEditingController());
final TextEditingController companySizeConntroller = TextEditingController();
final TextEditingController industryController = TextEditingController();
final TextEditingController websiteController = TextEditingController();
final signupformKey = GlobalKey<FormState>();
final aboutEditingController = TextEditingController();
final List<String> industries = [
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

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TopColorSafeArea(
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                loggedIn: (token) {
                  NotificationClass.snakBarSuccess(
                      'Signup Successflly 👋😎', context);
                },
                error: (message) {
                  NotificationClass.snakBarError(message, context);
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => buildSignup(context),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loggedIn: (_) => const DashboardScrn(),
                error: (_) => buildSignup(context),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget buildSignup(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
    child: SingleChildScrollView(
      child: Form(
        key: signupformKey,
        child: Consumer<SignUpProvider>(
          builder: (context, formPro, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Getting Started', style: mainTitle),
                const Text('Create an account to continue!'),
                sizedBox20H,
                TextFieldClass().buildCompanyNameField(
                    context, companyNameEditingController),
                TextFieldClass()
                    .buildCompanymailField(context, emailEditingController),
                TextFieldClass()
                    .buildPasswordField(context, passwordEditingController),
                TextFieldClass()
                    .buildContactNumberField(context, phoneNoEditingController),
                TextFieldClass()
                    .buildAddressField(context, addressEditingController),
                ValueListenableBuilder(
                  valueListenable: locationEditingControllerNotifier,
                  builder: (context, locationController, child) =>
                      TextFieldClass()
                          .buildLocationField(context, locationController),
                ),
                TextFieldClass()
                    .buildAboutField(context, aboutEditingController),
                TextFieldClass()
                    .buildCompanySizeField(context, companySizeConntroller),
                TextFieldClass()
                    .buildIndustryField(context, industryController),
                TextFieldClass()
                    .buildWebsiteLinkField(context, websiteController),
                sizedBox10H,
                ElevatedBtnWidget(
                  onPressed: () {
                    signupFun(signupformKey, context);
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
  );
}

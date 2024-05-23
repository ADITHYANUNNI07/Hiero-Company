import 'package:flutter/material.dart';
import 'package:hiero_company/domain/core/colors/colors.dart';
import 'package:hiero_company/domain/core/widgets/widget.dart';
import 'package:hiero_company/domain/core/widgets/textfields.dart';

class AddJobInternPostScrn extends StatelessWidget {
  AddJobInternPostScrn({super.key});
  final profileNameController = TextEditingController();
  final internOrJobController = TextEditingController();
  final aboutCompanyController = TextEditingController();
  final startingDateController = TextEditingController();
  final jobTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TopColorSafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: scaffoldBackgroundColor,
            foregroundColor: colorBlack,
            elevation: 0.3,
            title: const Text('Add Job/Internship'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Form(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldClass()
                      .buildProfileNameField(context, profileNameController),
                  TextFieldClass()
                      .buildInternORJobField(context, internOrJobController),
                  TextFieldClass()
                      .buildAboutCompanyField(context, aboutCompanyController),
                  TextFieldClass()
                      .buildStartingDateField(context, startingDateController),
                  TextFieldClass().buildJobTypeField(context, jobTypeController)
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}

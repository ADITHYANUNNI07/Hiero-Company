import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hiero_company/application/job/job_bloc.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/notification/notification.dart';
import 'package:hiero_company/core/provider/provider.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/core/widgets/textfields.dart';
import 'package:hiero_company/presentation/job/add%20job/function/fun_add_job.dart';
import 'package:hiero_company/presentation/signup/signup_screen.dart';
import 'package:provider/provider.dart';

final profileNameController = TextEditingController();
final experienceLevelController = TextEditingController();
final aboutCompanyController = TextEditingController();
final applicationDeadlineController = TextEditingController();
final jobTypeController = TextEditingController();
final reqirementController = TextEditingController();
final educationLevelController = TextEditingController();
final salaryController = TextEditingController();
final skillController = TextEditingController();
final profileTypeController = TextEditingController();
final jobFormkey = GlobalKey<FormState>();

class AddJobInternPostScrn extends StatelessWidget {
  const AddJobInternPostScrn({super.key});

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
          body: BlocConsumer<JobBloc, JobState>(
            listener: (context, state) {
              state.whenOrNull(
                loggedIn: (token) {
                  NotificationClass.snakBarSuccess('Post created✅💼', context);
                  Navigator.pop(context);
                },
                error: (message) {
                  NotificationClass.snakBarError(message, context);
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => addJobWidget(context),
                loading: () => const Center(child: CircularProgressIndicator()),
                loggedIn: (token) => addJobWidget(context),
                error: (message) => addJobWidget(context),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding addJobWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Form(
          key: jobFormkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldClass()
                    .buildJoborInternField(context, profileTypeController),
                TextFieldClass()
                    .buildProfileNameField(context, profileNameController),
                TextFieldClass()
                    .buildAboutCompanyField(context, aboutCompanyController),
                TextFieldClass()
                    .buildRequirementField(context, reqirementController),
                TextFieldClass().buildStartingDateField(
                    context, applicationDeadlineController),
                TextFieldClass().buildJobTypeField(context, jobTypeController),
                ValueListenableBuilder(
                  valueListenable: locationEditingControllerNotifier,
                  builder: (context, locationController, child) =>
                      TextFieldClass()
                          .buildLocationField(context, locationController),
                ),
                TextFieldClass().buildexperienceLevelField(
                    context, experienceLevelController),
                TextFieldClass().buildEducationQualificationField(
                    context, educationLevelController),
                TextFieldClass().buildSalaryField(context, salaryController),
                sizedBox15H,
                const Text(
                  'Skill',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                sizedBox10H,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormWidget(
                        controller: skillController,
                        isNolabel: true,
                        icon: Icons.skateboarding,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedBtnWidget(
                      onPressed: () {
                        Provider.of<SkillProvider>(context, listen: false)
                            .addSkill(skillController.text);
                        skillController.clear();
                      },
                      title: 'ADD',
                      btnColor: colorApp,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Consumer<SkillProvider>(
                  builder: (context, skillProvider, child) {
                    return Wrap(
                      spacing: 8,
                      children: skillProvider.skills.map((skill) {
                        return ChoiceChip(
                          label: Text(skill),
                          selected: false,
                          onSelected: (bool selected) {
                            skillProvider.removeSkill(skill);
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
                sizedBox10H,
                ElevatedBtnWidget(
                  onPressed: () {
                    addJob(jobFormkey, SkillProvider().skills);
                  },
                  title: 'ADD JOB',
                  btnColor: colorApp,
                ),
                sizedBox5H
              ],
            ),
          )),
    );
  }
}

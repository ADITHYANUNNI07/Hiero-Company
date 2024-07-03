import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_company/application/job/job_bloc.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/notification/notification.dart';
import 'package:hiero_company/core/provider/provider.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/core/widgets/textfields.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/job/add%20job/function/fun_add_job.dart';
import 'package:hiero_company/presentation/signup/signup_screen.dart';
import 'package:provider/provider.dart';

TextEditingController profileNameController = TextEditingController();
TextEditingController experienceLevelController = TextEditingController();
TextEditingController descriptionCompanyController = TextEditingController();
TextEditingController applicationDeadlineController = TextEditingController();
TextEditingController employmentTypeController = TextEditingController();
TextEditingController reqirementController = TextEditingController();
TextEditingController educationLevelController = TextEditingController();
TextEditingController salaryController = TextEditingController();
TextEditingController skillController = TextEditingController();
TextEditingController profileTypeController = TextEditingController();
TextEditingController opportunitiesController = TextEditingController();
TextEditingController startingDateController = TextEditingController();
TextEditingController yearOfExperienceController = TextEditingController();
final jobFormkey = GlobalKey<FormState>();

class AddJobInternPostScrn extends StatefulWidget {
  const AddJobInternPostScrn({super.key, this.jobmodel});
  final JobModel? jobmodel;
  @override
  State<AddJobInternPostScrn> createState() => _AddJobInternPostScrnState();
}

class _AddJobInternPostScrnState extends State<AddJobInternPostScrn> {
  @override
  void initState() {
    if (widget.jobmodel != null) {
      final model = widget.jobmodel;
      profileNameController = TextEditingController(text: model!.title);
      profileTypeController = TextEditingController(text: model.type);
      descriptionCompanyController =
          TextEditingController(text: model.description);
      reqirementController = TextEditingController(text: model.requirements);
      startingDateController = TextEditingController(text: model.startingDate);
      locationEditingControllerNotifier.value =
          TextEditingController(text: model.location);
      educationLevelController =
          TextEditingController(text: model.educationLevel);
      employmentTypeController =
          TextEditingController(text: model.employmentType);
      salaryController = TextEditingController(text: model.salary);
      applicationDeadlineController =
          TextEditingController(text: model.deadline);
      opportunitiesController =
          TextEditingController(text: model.opportunities);
      yearOfExperienceController =
          TextEditingController(text: model.yearOfExperience);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        for (var skill in model.skills) {
          Provider.of<SkillProvider>(context, listen: false).addSkill(skill);
        }
        Provider.of<SignUpProvider>(context, listen: false)
            .setJoborIntern(model.type);
        Provider.of<SignUpProvider>(context, listen: false)
            .setSelectedJobTypes(model.employmentType);
        Provider.of<SignUpProvider>(context, listen: false)
            .setexperienceLevel(model.experienceLevel);
      });
    }
    super.initState();
  }

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
          body: Consumer<SignUpProvider>(
            builder: (context, jobTypeProvider, child) =>
                BlocConsumer<JobBloc, JobState>(
              listener: (context, state) {
                state.whenOrNull(
                  loggedIn: (token) {
                    NotificationClass.snakBarSuccess(
                        'Post created✅💼', context);
                    clearJobAllControllers();
                    jobTypeProvider.clearAllFields();
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
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loggedIn: (token) => addJobWidget(context),
                  error: (message) => addJobWidget(context),
                );
              },
            ),
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
                TextFieldClass().buildAboutCompanyField(
                    context, descriptionCompanyController),
                TextFieldClass()
                    .buildRequirementField(context, reqirementController),
                TextFieldClass()
                    .buildStartingDateField(context, startingDateController),
                TextFieldClass()
                    .buildJobTypeField(context, employmentTypeController),
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
                TextFieldClass()
                    .buildDeadLineField(context, applicationDeadlineController),
                TextFieldClass()
                    .buildopportunitiesField(context, opportunitiesController),
                TextFieldClass()
                    .buildYearofExpField(context, yearOfExperienceController),
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
                            .addSkill(capitalize(skillController.text.trim()));
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
                          avatar: const FaIcon(FontAwesomeIcons.circleXmark),
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
                Consumer<SkillProvider>(
                  builder: (context, skillProvider, child) => ElevatedBtnWidget(
                    onPressed: () {
                      addJobFUN(jobFormkey, skillProvider.skills, context);
                    },
                    title: 'ADD JOB',
                    btnColor: colorApp,
                  ),
                ),
                sizedBox5H
              ],
            ),
          )),
    );
  }
}

void clearJobAllControllers() {
  profileNameController.clear();
  experienceLevelController.clear();
  descriptionCompanyController.clear();
  applicationDeadlineController.clear();
  employmentTypeController.clear();
  reqirementController.clear();
  educationLevelController.clear();
  salaryController.clear();
  skillController.clear();
  profileTypeController.clear();
  opportunitiesController.clear();
  startingDateController.clear();
  yearOfExperienceController.clear();
}

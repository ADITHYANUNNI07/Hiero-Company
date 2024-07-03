import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiero_company/application/job/job_bloc.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/config/api_config.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/job/add%20job/add_job.dart';
import 'package:hiero_company/presentation/signup/signup_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

addJobFUN(GlobalKey<FormState> jobFormkey, List<String> skillList,
    BuildContext context) {
  if (jobFormkey.currentState!.validate()) {
    if (skillList.isNotEmpty) {
      final jobModel = JobModel(
          title: profileNameController.text.trim(),
          type: profileTypeController.text.isEmpty
              ? 'Job'
              : profileTypeController.text.trim(),
          description: descriptionCompanyController.text.trim(),
          requirements: reqirementController.text.trim(),
          location: locationEditingControllerNotifier.value.text.trim(),
          employmentType: employmentTypeController.text.isEmpty
              ? 'Work from home'
              : employmentTypeController.text.trim(),
          salary: salaryController.text.trim(),
          skills: skillList,
          experienceLevel: experienceLevelController.text.isEmpty
              ? 'Entery-level'
              : experienceLevelController.text.trim(),
          educationLevel: educationLevelController.text.trim(),
          deadline: applicationDeadlineController.text.trim(),
          opportunities: opportunitiesController.text.trim(),
          startingDate: startingDateController.text.trim(),
          yearOfExperience: yearOfExperienceController.text.trim());
      context
          .read<JobBloc>()
          .add(JobEvent.addJob(jobModel, AppDevConfig.accessToken));
    } else {
      Fluttertoast.showToast(
          msg: 'Please Enter the Skills⛷️',
          backgroundColor: colorAppLight,
          toastLength: Toast.LENGTH_SHORT);
    }
  }
}

String capitalize(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

String convertDateTimeString(String dateString) {
  DateTime parsedDate = DateFormat('dd MMM yyyy').parse(dateString);
  DateTime dateWithTime = DateTime(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    parsedDate.hour,
    parsedDate.minute,
    parsedDate.second,
  );
  DateTime utcDate = dateWithTime.toUtc();
  String formattedDate = utcDate.toIso8601String();
  formattedDate = formattedDate.replaceAll(RegExp(r'\.\d+'), '');
  return formattedDate;
}

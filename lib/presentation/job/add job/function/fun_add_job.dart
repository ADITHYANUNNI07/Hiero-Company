import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/job/add%20job/add_job.dart';
import 'package:hiero_company/presentation/job/display%20job/job_post.dart';

addJob(GlobalKey<FormState> jobFormkey, List<String> skillList) {
  if (jobFormkey.currentState!.validate()) {
    if (skillList.isNotEmpty) {
      final jobModel = JobModel(
          title: profileNameController.text.trim(),
          description: aboutCompanyController.text.trim(),
          requirements: reqirementController.text.trim(),
          location: locationController.text.trim(),
          employmentType: jobTypeController.text,
          salary: salaryController.text.trim(),
          skills: skillList,
          experienceLevel: educationLevelController.text.trim(),
          educationLevel: educationLevelController.text,
          deadline: applicationDeadlineController.text.trim());
    } else {
      Fluttertoast.showToast(
          msg: 'Please Enter the Skills⛷️',
          backgroundColor: colorAppLight,
          toastLength: Toast.LENGTH_SHORT);
    }
  }
}

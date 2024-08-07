// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hiero_company/core/config/api_config.dart';
import 'package:hiero_company/infrastructure/helper/sharedpreference.dart';
import 'package:hiero_company/presentation/dashboard/dashboard_screen.dart';
import 'package:hiero_company/presentation/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

void splashtime(BuildContext context) async {
  Future.delayed(
    const Duration(seconds: 4),
    () async {
      final sharedController =
          Provider.of<SharedPreferenceClass>(context, listen: false);
      await sharedController.getAccessTokenStatus();
      await sharedController.getCompanyNameStatus();
      AppDevConfig.accessToken = sharedController.accessToken ?? '';
      AppDevConfig.companyName = sharedController.companyName ?? '';
      if (sharedController.accessToken == null ||
          sharedController.accessToken!.isEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScrn()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DashboardScrn()),
        );
      }
    },
  );
}

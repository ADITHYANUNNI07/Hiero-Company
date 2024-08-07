import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_company/application/auth/auth_bloc.dart';
import 'package:hiero_company/application/job/job_bloc.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/provider/provider.dart';
import 'package:hiero_company/domain/services/auth/auth_repository.dart';
import 'package:hiero_company/domain/services/job/job_repository.dart';
import 'package:hiero_company/infrastructure/helper/sharedpreference.dart';
import 'package:hiero_company/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepository())),
        BlocProvider(create: (context) => JobBloc(JobRepository()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GenderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SharedPreferenceClass(),
        ),
        ChangeNotifierProvider(
          create: (context) => SkillProvider(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: customPrimaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          primaryColor: const Color(0xFF0A65CC),
          iconTheme: const IconThemeData(color: Color(0xFF0A65CC)),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Color(0xFF0A65CC),
          ),
          textTheme: GoogleFonts.poppinsTextTheme().apply(),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/Views/Screens/Home/home.dart';
import 'package:moaadal_mozon/src/preferences/shared_preferences_service.dart';
import 'package:moaadal_mozon/src/Views/Screens/Onboarding/onboarding_one.dart';
import 'package:moaadal_mozon/src/provider/field_provider.dart';
import 'package:provider/provider.dart';
import 'src/core/themes/theme_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init(); // Initialize Shared Preferences

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: ChangeNotifierProvider<FieldProvider>(
        create: (context) => FieldProvider(),
        child: const OnboardingOne(),
      ),
    );
  }
}

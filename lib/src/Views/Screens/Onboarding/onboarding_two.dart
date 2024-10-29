import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/Views/Screens/Home/home.dart';
import 'package:moaadal_mozon/src/Views/Screens/Home/home_page_wrapper.dart';
import '../../../core/constants/constants.dart';
import '../../../preferences/shared_preferences_service.dart';
import '../../Widgets/onboarding.dart';
import 'onboarding_widget/combined_three.dart';
import 'onboarding_widget/combined_two.dart';
import 'onboarding_widget/title.dart';

class OnboardingTwo extends StatefulWidget {
  const OnboardingTwo({Key? key}) : super(key: key);

  @override
  State<OnboardingTwo> createState() => _OnboardingTwoState();
}

class _OnboardingTwoState extends State<OnboardingTwo> {
  @override
  Widget build(BuildContext context) {
    return OnBoarding(
      titleText: titleAppBar(
          context: context,
          skip: true,
          titile: AppStrings.onboardingTwo[0],
          caption: AppStrings.onboardingTwo[1]),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CombinedThreeValue(),
            CombinedTwoValue(
                titleLabel: "note Math", labelSaved: AppStrings.math),
            CombinedTwoValue(
                titleLabel: "note Physics", labelSaved: AppStrings.physics),
            CombinedTwoValue(
                titleLabel: "note Science", labelSaved: AppStrings.science),
            //CombinedValue(labelName: "Math"),
            //const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  SharedPreferencesService.setBool(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePageWrapper()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

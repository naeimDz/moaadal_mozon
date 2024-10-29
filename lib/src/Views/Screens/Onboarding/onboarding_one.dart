import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/Views/Screens/Onboarding/onboarding_three.dart';
import 'package:moaadal_mozon/src/Views/Screens/Onboarding/onboarding_two.dart';
import '../../../core/constants/constants.dart';
import '../../../preferences/shared_preferences_service.dart';
import '../../Widgets/onboarding.dart';
import 'onboarding_widget/title.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return OnBoarding(
      titleText: titleAppBar(
          context: context,
          titile: AppStrings.onboardingOne[0],
          caption: AppStrings.onboardingOne[1]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: AppStrings.branchs.asMap().entries.map((entry) {
                final index = entry.key;
                final strings = entry.value;
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tappedIndex = index;
                      SharedPreferencesService.setString(
                          AppStrings.branch, strings);
                    });
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      tappedIndex == index
                          ? AppColors.primary
                          : AppColors.whiteText,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                          color: tappedIndex == index
                              ? AppColors.whiteText
                              : AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  child: Text(strings,
                      style: AppTextStyles.h4.copyWith(
                        color: tappedIndex == index
                            ? AppColors.whiteText
                            : AppColors.primary,
                      )),
                );
              }).toList(),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingTwo()),
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
          ],
        ),
      ),
    );
  }
}

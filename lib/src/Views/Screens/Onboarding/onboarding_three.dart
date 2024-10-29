import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/Views/Widgets/onboarding.dart';
import '../../../Services/picker.dart';
import '../../../core/constants/constants.dart';
import 'onboarding_widget/title.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoarding(
        titleText: titleAppBar(
            context: context,
            skip: true,
            titile: AppStrings.onboardingTwo[0],
            caption: AppStrings.onboardingTwo[1]),
        child: Container(
          width: 400,
          color: Colors.orangeAccent,
          child: NumberPicker(
            value: 17, // Set your initial value here
            minValue: 10, // Set the minimum value here
            maxValue: 19, // Set the maximum value here
            step: 1, // Set the step size here
            itemHeight: 80, // Set the desired item height here
            axis: Axis.vertical, // Set the axis (vertical or horizontal) here
            decimal: true,
            onChanged: (value) {
              // Handle the value change here
              print("onboardingthree");
            },
          ),
        ));
  }
}

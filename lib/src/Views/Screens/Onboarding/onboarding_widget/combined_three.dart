import 'package:flutter/material.dart';
import '../../../../Services/combined_value.dart';
import '../../../../Services/picker.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../preferences/shared_preferences_service.dart';

class CombinedThreeValue extends StatefulWidget {
  const CombinedThreeValue({super.key});

  @override
  State<CombinedThreeValue> createState() => _CombinedThreeValueState();
}

class _CombinedThreeValueState extends State<CombinedThreeValue> {
  int firstValue = 17;
  int secondValue = 0;
  int thirdValue = 3;
  @override
  Widget build(BuildContext context) {
    return CombinedValue(
      titleLabel: "note Moyen",
      pickerNumberDecimal: NumberPicker(
        value: 17, // Set your initial value here
        minValue: 10, // Set the minimum value here
        maxValue: 19, // Set the maximum value here
        step: 1, // Set the step size here
        itemHeight: 80, // Set the desired item height here
        axis: Axis.vertical, // Set the axis (vertical or horizontal) here
        decimal: true,
        onChanged: (value) {
          // Handle the value change here
          setState(() {
            firstValue = value;
            updateCombinedValue();
          });
        },
      ),
      pickerNumberfirst: NumberPicker(
        value: 0, // Set your initial value here
        minValue: 0, // Set the minimum value here
        maxValue: 9, // Set the maximum value here
        step: 1, // Set the step size here
        itemHeight: 80, // Set the desired item height here
        axis: Axis.vertical, // Set the axis (vertical or horizontal) here
        onChanged: (value) {
          // Handle the value change here
          setState(() {
            updateCombinedValue();
          });
        },
      ),
      pickerNumbertwo: NumberPicker(
        value: 3, // Set your initial value here
        minValue: 0, // Set the minimum value here
        maxValue: 9, // Set the maximum value here
        step: 1, // Set the step size here
        itemHeight: 80, // Set the desired item height here
        axis: Axis.vertical, // Set the axis (vertical or horizontal) here
        onChanged: (value) {
          setState(() {
            thirdValue = value;
            updateCombinedValue();
          });
        },
      ),
    );
  }

  void updateCombinedValue() {
    String combinedValue =
        '${firstValue.toString()}.${secondValue.toString()}${thirdValue.toString()}';
    SharedPreferencesService.setString(AppStrings.moyen, combinedValue);
  }
}

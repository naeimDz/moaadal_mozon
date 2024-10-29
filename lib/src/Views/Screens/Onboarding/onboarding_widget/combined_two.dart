import 'package:flutter/material.dart';
import '../../../../Services/combined_value.dart';
import '../../../../Services/picker.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../preferences/shared_preferences_service.dart';

class CombinedTwoValue extends StatefulWidget {
  final String titleLabel;
  final String labelSaved;

  const CombinedTwoValue({
    super.key,
    required this.titleLabel,
    required this.labelSaved,
  });

  @override
  State<CombinedTwoValue> createState() => _CombinedTwoValueState();
}

class _CombinedTwoValueState extends State<CombinedTwoValue> {
  int firstValue = 17;
  int secondValue = 0;

  @override
  Widget build(BuildContext context) {
    return CombinedValue(
      titleLabel: widget.titleLabel,
      pickerNumberDecimal: NumberPicker(
        value: 17, // Set your initial value here
        minValue: 0, // Set the minimum value here
        maxValue: 20, // Set the maximum value here
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
        maxValue: 75, // Set the maximum value here
        step: 25, // Set the step size here
        itemHeight: 80, // Set the desired item height here
        axis: Axis.vertical, // Set the axis (vertical or horizontal) here
        onChanged: (value) {
          // Handle the value change here
          setState(() {
            updateCombinedValue();
          });
        },
      ),
    );
  }

  void updateCombinedValue() {
    String combinedValue = '${firstValue.toString()}.${secondValue.toString()}';
    SharedPreferencesService.setDouble(widget.labelSaved, double.parse(combinedValue));
  }
}

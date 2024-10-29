// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/preferences/shared_preferences_service.dart';
import '../core/constants/constants.dart';

class CombinedValue extends StatefulWidget {
  final String titleLabel;
  final Widget pickerNumberDecimal;
  final Widget pickerNumberfirst;

  const CombinedValue({
    Key? key,
    required this.titleLabel,
    required this.pickerNumberDecimal,
    required this.pickerNumberfirst,
    this.pickerNumbertwo,
  }) : super(key: key);
  final Widget? pickerNumbertwo;
  @override
  State<CombinedValue> createState() => _CombinedValueState();
}

class _CombinedValueState extends State<CombinedValue> {
  int firstValue = 17;
  int secondValue = 0;
  int thirdValue = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 40.0, top: 12, bottom: 12, right: 20),
            child: Text(
              widget.titleLabel,
              style: const TextStyle(color: AppColors.blackText),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 150,
              height: 80,
              child: widget.pickerNumberDecimal,
            ),
            SizedBox(
                width: widget.pickerNumbertwo != null ? 75 : 150,
                height: 70,
                child: widget.pickerNumberfirst),
            widget.pickerNumbertwo != null
                ? SizedBox(width: 75, height: 70, child: widget.pickerNumbertwo)
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  void updateCombinedValue() {
    String combinedValue =
        '${firstValue.toString()}.${secondValue.toString()}${thirdValue.toString()}';
    SharedPreferencesService.setString(AppStrings.moyen, combinedValue);
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final int index;
  final ValueChanged<int> onTap;

  const CustomButton(
      {required this.text, required this.index, required this.onTap});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isTapped = !isTapped;
          widget.onTap(widget.index);
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isTapped ? AppColors.primary : AppColors.whiteText,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          AppColors.primary,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
      child: Text(
        widget.text,
        style: AppTextStyles.bodySm,
      ),
    );
  }
}

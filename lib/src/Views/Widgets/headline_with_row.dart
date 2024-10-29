// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class HeadlineRow extends StatelessWidget {
  const HeadlineRow({
    Key? key,
    required this.headline,
    this.width,
    this.fontColor = AppColors.blackText,
    this.isHeader = true,
  }) : super(key: key);

  final String headline;
  final double? width;
  final Color fontColor;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headline.trim(),
            style: isHeader
                ? AppTextStyles.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  )
                : AppTextStyles.h5.copyWith(
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),
          ),
          const SizedBox(height: 7),
          Container(
            width: width ?? MediaQuery.of(context).size.width * 0.1,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
          )
        ],
      ),
    );
  }
}

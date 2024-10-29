// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class CardTitle extends StatelessWidget {
  final double? width;
  final String name;
  const CardTitle({
    Key? key,
    this.width,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        //color: AppColors.scaffoldBackground,
        border: Border.all(
          color: AppColors.primary, // Replace with your desired color
          width: 2.0, // Set the width of the border
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(70),
          bottomLeft: Radius.circular(70),
        ),
        //color: Color.fromARGB(26, 255, 255, 255),
      ),
      width: width ?? MediaQuery.of(context).size.width * 0.6,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, top: 20, bottom: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.h5.copyWith(color: AppColors.blackText),
              maxLines: 4,
            ),
            SizedBox(height: 10),
            Text(
              "16",
              style: AppTextStyles.h5.copyWith(color: AppColors.blackText),
            ),
          ],
        ),
      ),
    );
  }
}

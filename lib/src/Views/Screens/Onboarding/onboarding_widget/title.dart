import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

Widget titleAppBar(
    {bool skip = false,
    required BuildContext context,
    required String titile,
    required String caption}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 17),
          child: Center(
            child: Row(
              children: [
                if (skip)
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                const Expanded(
                  child: Center(
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                ),
                if (skip)
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      // Handle icon button action
                    },
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            titile,
            style: AppTextStyles.h4.copyWith(color: AppColors.whiteText),
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            caption,
            style: AppTextStyles.bodySm.copyWith(color: AppColors.whiteText),
            maxLines: 3,
          ),
        ),
      ],
    ),
  );
}

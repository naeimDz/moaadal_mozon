import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/core/constants/app_strings.dart';
import '../../../Widgets/headline_with_row.dart';
import 'card_title.dart';

class SharedBranch extends StatelessWidget {
  const SharedBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlineRow(
          headline: "ميادين التسجيل بالمعدل العام",
          //headline: "ميادين التسجيل بالمعدل الموزون",
          width: 70,
        ),
        Expanded(
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                AppStrings.sharedBranches.length,
                (index) {
                  return CardTitle(
                    name: AppStrings.sharedBranches[index],
                  );
                },
              )),
        )
      ],
    );
  }
}

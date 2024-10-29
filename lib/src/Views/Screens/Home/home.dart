import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/core/constants/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../provider/field_provider.dart';
import 'home_widgets/selected_branch.dart';
import 'home_widgets/shared_branch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // Access the FieldProvider and call the filterFields() method
      FieldProvider fieldProvider =
          Provider.of<FieldProvider>(context, listen: false);
      fieldProvider.filterFields();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.3,
                    color: AppColors.placeholder,
                    child: SharedBranch(),
                  ),
                  //SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    color: AppColors.placeholder,
                    height: size.height * 0.6,
                    child: SelectedBranch(),
                  )
                ],
              ),
            )));
  }
}

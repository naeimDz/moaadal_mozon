// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class OnBoarding extends StatelessWidget {
  Widget titleText;
  Widget child;
  OnBoarding({
    Key? key,
    required this.titleText,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 250,
            child: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: size.height * 0.3,
              backgroundColor: AppColors.primary,
              title: titleText,
            ),
          ),
          Card(
            margin: EdgeInsets.only(
                left: 20, right: 20, top: size.height * 0.3, bottom: 20),
            child: child,
          ),
        ],
      ),
    );
  }
}

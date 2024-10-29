import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/Views/Screens/Home/home.dart';
import 'package:provider/provider.dart';
import '../../../provider/field_provider.dart';


class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FieldProvider>(
      create: (_) => FieldProvider(),
      child: HomePage(),
    );
  }
}

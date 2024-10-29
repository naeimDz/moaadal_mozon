import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:moaadal_mozon/src/core/constants/app_strings.dart';
import 'package:moaadal_mozon/src/preferences/shared_preferences_service.dart';
import '../Models/field.dart';
import '../Services/calcul.dart';

class FieldProvider with ChangeNotifier {
  // Define a list to hold the filtered fields
  List<Field> allFields = [];
  List<Field> filteredFields = [];

  // Create a method to filter the fields
  Future<void> filterFields() async {
    // قراءة الملف JSON
    String jsonContent = await rootBundle.loadString('assets/json/fields.json');
    Map<String, dynamic> data = json.decode(jsonContent);

    // تحديد اسم التخصص للفلترة
    String specializationName =
        SharedPreferencesService.getString(AppStrings.branch);

    double moyen =
        double.parse(SharedPreferencesService.getString(AppStrings.moyen));

    // البحث عن الميادين التي تحتوي على التخصص المحدد
    for (var field in data["fields"]) {
      if (field["specializations"]
          .any((s) => s["name"] == specializationName)) {
        if (field["moyen"]) {
          double moyen = calculMoyen(
              double.parse(
                  SharedPreferencesService.getString(AppStrings.moyen)),
              SharedPreferencesService.getListDouble(field["format"]));
        }

        String fieldName = field["field_name"];
        int priority = field["specializations"]
            .firstWhere((s) => s["name"] == specializationName)["priority"];
        allFields.add(Field(fieldName, priority, moyen));
      }
    }
    filteredFields = allFields;
    // Notify listeners that the data has changed
    notifyListeners();
  }

  void updateFilteredFields(List<int> pr) {
    filteredFields = allFields
        .where((element) => pr.any((priority) => priority == element.priority))
        .toList();
    notifyListeners();
  }
}

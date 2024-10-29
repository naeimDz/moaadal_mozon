/*import 'dart:convert';
import 'package:flutter/services.dart';

import '../Models/field.dart';

Future<List<Field>> filterFields() async {
  // قراءة الملف JSON
  String jsonContent = await rootBundle.loadString('assets/json/fields.json');
  Map<String, dynamic> data = json.decode(jsonContent);

  // تحديد اسم التخصص للفلترة
  String specializationName = "رياضيات";

  // البحث عن الميادين التي تحتوي على التخصص المحدد
  List<Field> filteredFields = [];
  for (var field in data["fields"]) {
    if (field["specializations"].any((s) => s["name"] == specializationName)) {
      String fieldName = field["field_name"];
      int priority = field["specializations"]
          .firstWhere((s) => s["name"] == specializationName)["priority"];
      filteredFields.add(Field(fieldName, priority));
    }
  }

  return filteredFields;
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moaadal_mozon/src/core/constants/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../Models/field.dart';
import '../../../../Services/flt.dart';
import '../../../../provider/field_provider.dart';
import '../../../Widgets/headline_with_row.dart';
import 'card_title.dart';

class SelectedBranch extends StatefulWidget {
  const SelectedBranch({super.key});

  @override
  State<SelectedBranch> createState() => _SelectedBranchState();
}

class _SelectedBranchState extends State<SelectedBranch> {
  List<int> selected = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<FieldProvider>(builder: (context, fieldProvider, _) {
      // Access the filtered fields
      List<Field> filteredFields = fieldProvider.filteredFields;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineRow(
            headline: "ميادين التسجيل بالمعدل الموزون",
            width: 70,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  selected: selected.contains(1),
                  label: const Text("اولوية 1"),
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        selected.add(1);
                      } else {
                        selected.remove(1);
                      }
                      fieldProvider.updateFilteredFields(selected);
                    });
                  },
                ),
                FilterChip(
                  selected: selected.contains(2),
                  label: const Text("اولوية 2"),
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        selected.add(2);
                      } else {
                        selected.remove(2);
                      }
                      fieldProvider.updateFilteredFields(selected);
                    });
                  },
                ),
                FilterChip(
                  selected: selected.contains(3),
                  label: const Text("اولوية 3"),
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        selected.add(3);
                      } else {
                        selected.remove(3);
                      }
                      fieldProvider.updateFilteredFields(selected);
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
                children: List.generate(
                    filteredFields.length,
                    (index) => CardTitle(
                          name: filteredFields[index].fieldName,
                        )),
              ),
            ),
          )
        ],
      );
    });
  }
}

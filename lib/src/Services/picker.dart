import 'package:flutter/cupertino.dart';
import '../core/constants/constants.dart';

class NumberPicker extends StatefulWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final int step;
  final double itemHeight;
  final Axis axis;
  final bool decimal;
  final ValueChanged<int> onChanged;

  const NumberPicker({super.key, 
    required this.value,
    required this.minValue,
    required this.maxValue,
    this.step = 1,
    required this.itemHeight,
    this.axis = Axis.vertical,
    required this.onChanged,
    this.decimal = false,
  });

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    _scrollToInitialValue();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker.builder(
      scrollController: _scrollController,
      itemExtent: 40,
      diameterRatio: 0.5,
      magnification: 0.7,
      onSelectedItemChanged: (index) {
        int value = widget.minValue + (index * widget.step);
        widget.onChanged(value);
      },
      childCount:
          ((widget.maxValue - widget.minValue) / widget.step + 1).floor(),
      itemBuilder: (context, index) {
        int value = widget.minValue + (index * widget.step);
        return Center(
          child: Text(
            widget.decimal ? '$value.' : '$value',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  void _scrollToInitialValue() {
    int index = (widget.value - widget.minValue) ~/ widget.step;
    _scrollController.jumpToItem(index);
  }
}

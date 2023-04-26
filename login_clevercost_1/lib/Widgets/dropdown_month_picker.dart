import 'package:flutter/material.dart';

class MonthDropdown extends StatefulWidget {
  const MonthDropdown({super.key, required this.onValueChanged});

  final ValueChanged<String>? onValueChanged;
  @override
  State<MonthDropdown> createState() => _MonthDropdown();
}

class _MonthDropdown extends State<MonthDropdown> {
  List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      padding: const EdgeInsets.all(1),
      child: DropdownButton(
        isExpanded: true,
        value: selectedValue,
        items: monthList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) => setState(() {
          selectedValue = value;
          if (widget.onValueChanged != null && value != null) {
            widget.onValueChanged!(value);
          }
        }),
      ),
    );
  }
}

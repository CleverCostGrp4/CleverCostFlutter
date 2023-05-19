import 'package:flutter/material.dart';

class YearDropdown extends StatefulWidget {
const YearDropdown({super.key, required this.onValueChanged});

final ValueChanged<String>? onValueChanged;

  @override
  State<YearDropdown> createState() => _YearDropdown();
}


class _YearDropdown extends State<YearDropdown> {
  List<String> yearList = getList(2016);
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
        items: yearList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ); } ).toList(),
        onChanged: (value) => setState(() {
          selectedValue = value;
          if (widget.onValueChanged != null && value != null) {
            widget.onValueChanged!(value);
          }
        }),
        ),
    );
  }
}

 /*
  A method that takes a start year, and for each year till the current year it makes a string with the
  year as input. Then it returns a stringList with all the generated years
  */
List<String> getList(int startYear) {
  int endYear = DateTime.now().year;
  int yearDifference = endYear - startYear;
  List<int> yearList = List.empty(growable: true);

  for (int i = 0; i < yearDifference + 1; i++) {
    yearList.add(startYear + i);
  }
  List<String> stringYearList = yearList.map((e) => e.toString()).toList();

  return stringYearList;
}

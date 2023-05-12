import 'package:flutter/material.dart';

class CustomVATCheckboxes extends StatefulWidget {
  const CustomVATCheckboxes({super.key, required this.onValueChanged});

  final ValueChanged<int> onValueChanged;

  @override
  _CustomVATCheckboxesState createState() => _CustomVATCheckboxesState();
}

class _CustomVATCheckboxesState extends State<CustomVATCheckboxes> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCheckbox(1, 'Month'),
        _buildCheckbox(2, 'Quarter'),
        _buildCheckbox(3, 'Half year'),
        _buildCheckbox(4, 'Year'),
      ],
    );
  }

  Widget _buildCheckbox(int value, String text) {
    bool isChecked = _selectedValue == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedValue = value;
        });
        widget.onValueChanged(value);
      },
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.blue),
          color: isChecked ? Colors.blue : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(color: isChecked ? Colors.white : Colors.blue),
        ),
      ),
    );
  }
}

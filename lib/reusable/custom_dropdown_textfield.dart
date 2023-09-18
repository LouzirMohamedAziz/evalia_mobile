import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDropdownTextField extends StatefulWidget {
  final String text;
  final IconData icon;
  final List<String> dropdownItems;
  final String selectedValue;
  final void Function(String?)? onChanged; // Keep it nullable

  CustomDropdownTextField({
    required this.text,
    required this.icon,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _CustomDropdownTextFieldState createState() =>
      _CustomDropdownTextFieldState();
}

class _CustomDropdownTextFieldState extends State<CustomDropdownTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.selectedValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              widget.icon,
              color: mainEvaliaColor,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showDropdown(context);
              },
              child: TextFormField(
                controller: _controller,
                onTap: () {
                  showDropdown(context);
                },
                style: TextStyle(color: mainEvaliaTextColor),
                decoration: InputDecoration(
                  labelText: widget.text,
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.dropdownItems.map((String value) {
              return ListTile(
                title: Text(value),
                onTap: () {
                  setState(() {
                    _controller.text = value;
                  });
                  Navigator.of(context).pop();
                  widget.onChanged?.call(value);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

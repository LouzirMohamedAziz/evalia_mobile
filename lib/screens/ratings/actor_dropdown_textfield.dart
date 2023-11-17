import 'package:flutter/material.dart';

class ActorDropDownTextField extends StatefulWidget {
  @override
  _ActorDropDownTextFieldState createState() => _ActorDropDownTextFieldState();
}

class _ActorDropDownTextFieldState extends State<ActorDropDownTextField> {
  // Define a list to store the values retrieved from the database.
  List<String> databaseValues = [];

  // Controller for the text input field.
  TextEditingController textEditingController = TextEditingController();

  // The selected value from the dropdown.
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    // Fetch values from the database or an API.
    // You can replace this with your database fetching logic.
    databaseValues = fetchDatabaseValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedValue,
          items: databaseValues.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(labelText: 'Enter a new value'),
        ),
        ElevatedButton(
          onPressed: () {
            // Use the selectedValue or the textEditingController value as needed.
            print("Selected Value: $selectedValue");
            print("New Value: ${textEditingController.text}");
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  // Replace this function with your actual database fetching logic.
  List<String> fetchDatabaseValues() {
    // Simulating fetching values from the database.
    return ['Option 1', 'Option 2', 'Option 3'];
  }
}

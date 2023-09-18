import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'custom_dropdown_textfield.dart';

Widget logoWidget(String imageName) {
  return SizedBox(
    width: 260,
    height: 160,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(
                255, 39, 65, 92), // Choose a suitable background color
          ),
        ),
        Center(
          child: Image.asset(
            imageName,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}

TextField textField(
    String text, IconData icon, TextEditingController controller) {
  return TextField(
    controller: controller,
    cursorColor: Color.fromRGBO(0, 75, 141, 1),
    style: TextStyle(color: Color.fromRGBO(21, 50, 100, 1)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromRGBO(0, 75, 141, 1),
      ),
      labelText: text,
      border: UnderlineInputBorder(),
    ),
  );
}

TextField passwordtextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromRGBO(0, 75, 141, 1),
    style: TextStyle(color: Color.fromRGBO(0, 75, 141, 1)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromRGBO(0, 75, 141, 1),
      ),
      labelText: text,
      border: UnderlineInputBorder(),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
      width: 200,
      height: 50,
      // margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Color.fromRGBO(0, 75, 141, 1);
                }
                return Color.fromRGBO(0, 75, 141, 1);
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          child: Text(
            isLogin ? 'LOG IN' : 'SIGN UP',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          )));
}

CustomDropdownTextField customDropdownField(
  String text,
  IconData icon,
  List<String> dropdownItems,
  String selectedValue,
  void Function(String?)? onChanged,
) {
  return CustomDropdownTextField(
    text: text,
    icon: icon,
    dropdownItems: dropdownItems,
    selectedValue: selectedValue,
    onChanged: onChanged,
  );
}

class BigCard extends StatelessWidget {
  const BigCard({
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asPascalCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

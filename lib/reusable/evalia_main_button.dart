import 'package:flutter/material.dart';

class EvaliaMainButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback? onPress; // Add this parameter

  EvaliaMainButton({
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 24.0,
    this.onPress, // Initialize the onPress parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Call the onPressed function when the button is tapped
      child: Container(
        width: 270,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFF004B8D),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EvaliaTitleText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  EvaliaTitleText({
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 24.0, // Default font size
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(0, 75, 141, 1),
        fontFamily: 'Poppins',
        fontSize: fontSize, // Use the 'fontSize' parameter here
        letterSpacing: 0,
        fontWeight: fontWeight,
        height: 1,
      ),
    );
  }
}

// To use this widget, you can type in parameter the text you want to display and the weight option as follow:
// EvaliaTitleText(text: 'Your Text', fontWeight: FontWeight.w600),        // Semi-bold
// EvaliaTitleText(text: 'Another Text'),                                  // Normal (default)
// EvaliaTitleText(text: 'Bold Text Example',fontWeight: FontWeight.bold), // Set the font weight to bold
//
//
// Also, the you can modify the fontSize as you wish as follow:
// EvaliaTitleText(text: 'Custom Text',fontWeight: FontWeight.bold,fontSize: 28.0), // Custom font size

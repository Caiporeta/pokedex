import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final textColor;
  final fontSize;

  const ErrorMessage({Key? key, this.textColor, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
        fontFamily: 'Antique',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: textColor);

    return Text("Sorry, didn't get that...", style: _textStyle);
  }
}

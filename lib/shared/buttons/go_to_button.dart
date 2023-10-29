import 'package:flutter/material.dart';

class GoToButton extends StatefulWidget {
  final void Function() goTo;

  const GoToButton({Key? key, required this.goTo}) : super(key: key);

  @override
  State<GoToButton> createState() => _GoToButtonState();
}

class _GoToButtonState extends State<GoToButton> {

  final _buttonStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(30.0, 5.0),
      primary: const Color(0xff53ae5f),
      shadowColor: const Color(0xff232323),
      elevation: 2.0,
      shape: const ContinuousRectangleBorder());

  final Icon _icon = const Icon(
    Icons.arrow_forward_ios,
    color: Colors.white,
    size: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
            onPressed: widget.goTo,
            style: _buttonStyle,
            child: _icon));
  }
}

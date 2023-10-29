import 'package:flutter/material.dart';

class PokemonSearch extends StatefulWidget {
  const PokemonSearch({Key? key}) : super(key: key);

  @override
  State<PokemonSearch> createState() => _PokemonSearchState();
}

class _PokemonSearchState extends State<PokemonSearch> {
  final FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onTap: () {
          _focus.requestFocus();
        },
        onSubmitted: (value) {
          _focus.unfocus();
        },
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        cursorWidth: 4.0,
        showCursor: true,
        cursorColor: Theme.of(context).hintColor,
        style: const TextStyle(
            fontFamily: 'Antique',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.white,
            letterSpacing: 2.0),
        decoration: InputDecoration(
            labelText: 'Type here to search Pokemon',
            labelStyle: TextStyle(
                fontFamily: 'Antique',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).cardColor,
                letterSpacing: 1.5),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2.0, color: Theme.of(context).hintColor),
            )),
      ),
    );
  }
}

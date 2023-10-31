import 'package:flutter/material.dart';
import 'package:pokedex/features/information/model/pokemon_abilities.dart';

class PokemonMoves extends StatefulWidget {
  final PokemonAbilities abilitiesData;

  const PokemonMoves(this.abilitiesData, {Key? key}) : super(key: key);

  @override
  State<PokemonMoves> createState() => _PokemonMovesState();
}

class _PokemonMovesState extends State<PokemonMoves> {
  @override
  Widget build(BuildContext context) {
    return widget.abilitiesData.moves!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.abilitiesData.moves!.map((e) {
              return _move(e.move!.name!);
            }).toList())
        : const SizedBox.shrink();
  }

  Widget _move(String label) {
    const TextStyle _labelStyle = TextStyle(
        fontFamily: 'Antique',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label.toString()[0].toUpperCase() + label.toString().substring(1),
        style: _labelStyle,
      ),
    );
  }
}

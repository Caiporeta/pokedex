import 'package:flutter/material.dart';

import '../../model/pokemon_abilities.dart';
/*
 "stats":[
      {
         "base_stat":35,
         "effort":0,
         "stat":{
            "name":"hp",
            "url":"https://pokeapi.co/api/v2/stat/1/"
         }
      },
 */

class PokemonStats extends StatelessWidget {
  final PokemonAbilities abilitiesData;

  const PokemonStats(this.abilitiesData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: abilitiesData!.stats!.map((e) {
          return _stats(e!.baseStat!, e.stat!.name!, context);
        }).toList());
  }

  Widget _stats(int value, String label, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          _label(label),
          const SizedBox(
            width: 16.0,
          ),
          _value(value, context),
        ],
      ),
    );
  }

  Widget _label(String label) {
    const TextStyle _labelStyle = TextStyle(
        fontFamily: 'Antique',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    return Container(
      width: 120,
      child: Text(
        label.toString()[0].toUpperCase() + label.toString().substring(1),
        style: _labelStyle,
      ),
    );
  }

  Widget _value(int value, BuildContext context) {
    const TextStyle _valueStyle = TextStyle(
        fontFamily: 'Antique',
        color: Color(0xfff5e32e),
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    return Row(
      children: [
        Container(
          height: 20,
          width: 100,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey,
          ),
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xff28aaff),
            ),
            width: value.toDouble(),
          ),
        ),
        const SizedBox(width: 8.0,),
        Text(
          value.toString(),
          style: _valueStyle,
        ),
      ],
    );
  }
}

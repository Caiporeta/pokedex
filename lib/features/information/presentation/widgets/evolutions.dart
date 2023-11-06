import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pokedex/features/home/model/pokemon_card_model.dart';
import 'package:pokedex/features/information/model/evolutions.dart';
import 'package:pokedex/features/information/model/pokemon_variety.dart';
import 'package:pokedex/shared/buttons/go_to_button.dart';

import '../pages/pokemon_information.dart';

class Evolutions extends StatefulWidget {
  final PokemonEvolutions evolutions;

  const Evolutions(this.evolutions, {Key? key}) : super(key: key);

  @override
  State<Evolutions> createState() => _EvolutionsState();
}

class _EvolutionsState extends State<Evolutions> {
  List<Trigger> _evolutions = [];

  _getEvolutions() {
    _flatEvolution(widget.evolutions.chain!.evolvesTo!);
  }

  _flatEvolution(List<EvolvesTo> evolves) {
    if (evolves.isNotEmpty) {
      for (var element in evolves) {
        _evolutions.add(element.species!);
        var _evolvesTo = element.evolvesTo;
        _flatEvolution(_evolvesTo!);
      }
    }
  }

  String id = '';
  String _pictureUrl = '';

  @override
  void initState() {
    _getEvolutions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _evolutions.map((e) {
            return _pokemonCard(e);
          }).toList()

          // [_pokemonCard()],
          ),
    );
  }

// picture https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/25.svg
  Widget _pokemonCard(Trigger evolvesTo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _picture(evolvesTo.url!),
          const SizedBox(
            width: 16.0,
          ),
          _name(evolvesTo.name!),
          Spacer(),
          GoToButton(goTo: () {
            _goTo(evolvesTo.name!, evolvesTo);
          })
        ],
      ),
    );
  }

  void _goTo(String name, Trigger evolvesTo) {
    PokemonCardModel pokemon = PokemonCardModel(
      id: int.parse(id),
      url: evolvesTo.url!,
      name: name,
      image: _pictureUrl,
    );
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => PokemonInformation(
                  pokemon: pokemon,
                )));
  }

  Widget _picture(String url) {
    List<String> _splits = url.split('/');
    String _svgFile = _splits[_splits.length - 1];
    id = _splits[6];
    _pictureUrl =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg";

    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
            image: Svg(
          _pictureUrl,
          source: SvgSource.network,
        )),
      ),
    );
  }

  Widget _name(String name) {
    const TextStyle _labelStyle = TextStyle(
        fontFamily: 'Antique',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        letterSpacing: 2.0);

    return Text(
      name.toString()[0].toUpperCase() + name.toString().substring(1),
      style: _labelStyle,
    );
  }
}

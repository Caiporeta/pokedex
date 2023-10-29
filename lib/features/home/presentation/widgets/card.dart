import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/information/presentation/pages/pokemon_information.dart';

import '../../../../shared/buttons/go_to_button.dart';
import '../../../../shared/picture/pokemon_picture.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard({Key? key}) : super(key: key);

  final Map<int, Map<String, String>> _pokemons = {
    1: {
      'name': 'Bulbasaur',
      'url': "https://pokeapi.co/api/v2/pokemon-species/1",
      'picture':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg'
    },
    2: {
      'name': 'Ivysaur',
      'url': 'https://pokeapi.co/api/v2/pokemon-species/2',
      'picture':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/2.svg'
    }
  };

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _pokemons.entries.map((e) {
          return _card(e.key, e.value, context);
        }).toList());
  }

  Widget _card(int id, Map<String, String> details, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 70,
        child: Material(
          clipBehavior: Clip.antiAlias,
          shadowColor: Theme.of(context).shadowColor,
          elevation: 6.0,
          shape: BeveledRectangleBorder(
              side: BorderSide(color: Theme.of(context).cardColor, width: 4.0),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                // topRight: Radius.circular(20.0)
              )),
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokemonPicture(height: 50.0, url: details['picture']!),
                      const SizedBox(width: 24.0),
                      _pokemonName(details['name']!),
                      const Spacer(),
                      GoToButton(
                          goTo: () => _goToPokemonFile(
                              id,
                              context,
                              details['picture']!,
                              details['name']!,
                              details['url']!))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pokemonName(String name) {
    const TextStyle _textStyle = TextStyle(
        fontSize: 32.0,
        fontFamily: 'Antique',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Color(0xff232323));

    return Text(
      name,
      style: _textStyle,
    );
  }

  void _goToPokemonFile(int id, BuildContext context, String pictureUrl,
      String name, String url) {
    print("Go to pokemon file page - id = $id");
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => PokemonInformation(
                  pokemonID: id,
                  pokemonUrl: url,
                  picture: pictureUrl,
                  pokemonName: name,
                )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pokedex/features/information/model/pokemon_abilities.dart';
import 'package:pokedex/shared/assets/pokemon_types.dart';

import '../../model/egg_group.dart';
import '../../model/pokemon_info.dart';

class Info extends StatelessWidget {
  final PokemonInfo? pokemonInfo;
  final PokemonAbilities? pokemonAbilities;

  const Info(this.pokemonInfo, this.pokemonAbilities, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_types(), _infos()],
    );
  }

  Widget _types() {
    if (pokemonAbilities != null && pokemonAbilities!.types!.isNotEmpty) {
      return Row(
        children: pokemonAbilities!.types!.map((e) {
          String _asset = _getIcon(e);
          return _typeIcon(_asset);
        }).toList(),
      );
    } else {
      return Container();
    }
  }

  Widget _typeIcon(String asset) {
    const _padding = EdgeInsets.all(5.0);
    final _border = Border.all(width: 1.5, color: Colors.white);
    const _boxShape = BoxShape.circle;
    const double _size = 30.0;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(border: _border, shape: _boxShape),
        height: _size,
        width: _size,
        child: Padding(
          padding: _padding,
          child: Image(
              image: Svg(
            asset,
            source: SvgSource.asset,
          )),
        ),
      ),
    );
  }

  _getIcon(Types type) {
    switch (type.type!.name) {
      case 'bug':
        return PokemonTypes.bug;
      case 'dark':
        return PokemonTypes.dark;
      case 'dragon':
        return PokemonTypes.dragon;
      case 'electric':
        return PokemonTypes.electric;
      case 'fairy':
        return PokemonTypes.fairy;
      case 'fighting':
        return PokemonTypes.fighting;
      case 'fire':
        return PokemonTypes.fire;
      case 'flying':
        return PokemonTypes.flying;
      case 'ghost':
        return PokemonTypes.ghost;
      case 'grass':
        return PokemonTypes.grass;
      case 'ground':
        return PokemonTypes.ground;
      case 'ice':
        return PokemonTypes.ice;
      case 'normal':
        return PokemonTypes.normal;
      case 'poison':
        return PokemonTypes.poison;
      case 'psychic':
        return PokemonTypes.psychic;
      case 'rock':
        return PokemonTypes.rock;
      case 'steel':
        return PokemonTypes.steel;
      case 'water':
        return PokemonTypes.water;
    }
  }

  Widget _infos() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          (pokemonInfo!.isBaby == true)
              ? _info('', "It's a BABY pokemon!")
              : Container(),
          (pokemonInfo!.isLegendary == true)
              ? _info('', "It's a LEGENDARY pokemon!")
              : Container(),
          (pokemonInfo!.isBaby == true)
              ? _info('', "It's a MYTHICAL pokemon!")
              : Container(),
          _info(pokemonInfo!.id, 'Order'),
          _info(pokemonAbilities!.height, 'Height'),
          _info(pokemonAbilities!.weight, 'Weight'),
          _info(pokemonInfo!.shape!.name, 'Shape'),
          _info(pokemonAbilities!.baseExperience, 'Base Experience'),
          _info(pokemonInfo!.baseHappiness, 'Base Happiness'),
          _info(pokemonInfo!.captureRate, 'Capture Rate'),
          _info(pokemonInfo!.growthRate!.name, 'Growth Rate'),
          _eggGroups(pokemonInfo!.eggGroups!),
          _info(pokemonInfo!.habitat!.name, 'Habitat'),
          (pokemonInfo!.evolvesFromSpecies != null)
              ? _info(
                  pokemonInfo!.evolvesFromSpecies!.name
                          .toString()[0]
                          .toUpperCase() +
                      pokemonInfo!.evolvesFromSpecies!.name
                          .toString()
                          .substring(1),
                  'Evolves From')
              : Container(),
        ],
      ),
    );
  }

  Widget _info(dynamic info, String label) {
    const TextStyle _labelStyle = TextStyle(
        fontFamily: 'Antique',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    const TextStyle _infoStyle = TextStyle(
        fontFamily: 'Antique',
        color: Color(0xfff5e32e),
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            "$label ",
            style: _labelStyle,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            info.toString(),
            style: _infoStyle,
          )
        ],
      ),
    );
  }

  Widget _eggGroups(List<EggGroup> eggGroups) {
    const TextStyle _labelStyle = TextStyle(
        fontFamily: 'Antique',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    const TextStyle _infoStyle = TextStyle(
        fontFamily: 'Antique',
        color: Color(0xfff5e32e),
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        letterSpacing: 2.0);

    String _eggGroups = '';
    for (var i = 0; i < eggGroups.length; i++) {
      bool _isFirstElement = i == 0;
      bool _isLastElement = i == eggGroups.length - 1;

      if (_isFirstElement) {
        _eggGroups = eggGroups[i].name.toString() + ', ';
      } else if (_isLastElement) {
        _eggGroups = _eggGroups + eggGroups[i].name.toString();
      } else {
        _eggGroups = _eggGroups + eggGroups[i].name.toString() + ', ';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Text(
            "Egg Groups",
            style: _labelStyle,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            _eggGroups,
            style: _infoStyle,
          )
        ],
      ),
    );
  }
}

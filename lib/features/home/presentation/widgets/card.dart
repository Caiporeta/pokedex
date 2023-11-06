import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/features/home/model/pokemon_card_model.dart';
import 'package:pokedex/features/home/presentation/cubit/pokemon_home_card_cubit.dart';
import 'package:pokedex/features/information/presentation/pages/pokemon_information.dart';

import '../../../../shared/buttons/go_to_button.dart';
import '../../../../shared/picture/pokemon_picture.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({Key? key}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  final pokemonHomeCardCubit = GetIt.instance<PokemonHomeCardCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonHomeCardCubit>(
        create: (context) => pokemonHomeCardCubit..getPokemonsList(),
        child: _pokemonListBody());
  }

  Widget _pokemonListBody() {
    return BlocBuilder<PokemonHomeCardCubit, PokemonHomeCardState>(
        builder: (context, state) {
      if (state is PokemonHomeCardLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is PokemonHomeCardLoadedState) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: state.pokemonCards.map((e) {
              return _card(e);
            }).toList());
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _card(PokemonCardModel pokemon) {
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
                      PokemonPicture(height: 50.0, url: pokemon.image),
                      const SizedBox(width: 24.0),
                      _pokemonName(pokemon.name),
                      const Spacer(),
                      GoToButton(goTo: () => _goToPokemonFile(context, pokemon))
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

  void _goToPokemonFile(BuildContext context, PokemonCardModel pokemon) {
    print("Go to pokemon file page - id = ${pokemon.id}");
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => PokemonInformation(
                  pokemon: pokemon,
                )));
  }
}

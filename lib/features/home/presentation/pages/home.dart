import 'package:flutter/material.dart';
import 'package:pokedex/features/home/presentation/widgets/search.dart';

import '../../../../shared/layout/basic_layout.dart';
import '../widgets/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PokemonSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: PokemonCard(),
            ),
          )
        ],
      ),
    );
  }
}

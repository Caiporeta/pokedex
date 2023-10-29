import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/features/information/model/evolutions.dart';
import 'package:pokedex/features/information/model/move_data.dart';
import 'package:pokedex/features/information/model/pokemon_abilities.dart';
import 'package:pokedex/features/information/model/pokemon_info.dart';
import 'package:pokedex/features/information/presentation/cubit/pokemon_info_cubit.dart';
import 'package:pokedex/features/information/presentation/pages/error_case_page.dart';
import 'package:pokedex/features/information/presentation/widgets/evolutions.dart';
import 'package:pokedex/features/information/presentation/widgets/info.dart';
import 'package:pokedex/shared/error_message.dart';

import '../../../../shared/layout/basic_layout.dart';
import '../../../../shared/picture/pokemon_picture.dart';
import '../cubit/pokemon_abilities_cubit.dart';
import '../cubit/pokemon_evolutions_cubit.dart';
import '../widgets/moves.dart';
import '../widgets/stats.dart';

class PokemonInformation extends StatefulWidget {
  final int pokemonID;
  final String? pokemonUrl;
  final String pokemonName;
  final String picture;

  const PokemonInformation(
      {Key? key,
      required this.pokemonID,
      this.pokemonUrl,
      required this.picture,
      required this.pokemonName})
      : super(key: key);

  @override
  State<PokemonInformation> createState() => _PokemonInformationState();
}

class _PokemonInformationState extends State<PokemonInformation>
    with SingleTickerProviderStateMixin {
  final pokemonInfoCubit = GetIt.instance<PokemonInfoCubit>();
  final pokemonAbilitiesCubit = GetIt.instance<PokemonAbilitiesCubit>();
  final pokemonEvolutionsCubit = GetIt.instance<PokemonEvolutionsCubit>();
  Map<String, MoveData> _moves = {};

  static const List<Tab> _myTabs = <Tab>[
    Tab(text: "Info"),
    Tab(text: "Moves"),
    Tab(text: "Stats"),
    Tab(text: "Evolutions"),
  ];

  late TabController _tabController;
  late PokemonInfo? _infoData;
  late PokemonAbilities? _abilitiesData;
  late PokemonEvolutions? _evolutions;

  @override
  void initState() {
    _infoData = PokemonInfo();
    _abilitiesData = PokemonAbilities();
    _evolutions = PokemonEvolutions();
    super.initState();
    _tabController = TabController(vsync: this, length: _myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
        body: MultiBlocProvider(providers: [
      BlocProvider<PokemonInfoCubit>(
        create: (context) => pokemonInfoCubit..fetch(widget.pokemonUrl!),
      ),
      BlocProvider<PokemonAbilitiesCubit>(
        create: (context) => pokemonAbilitiesCubit..fetch(widget.pokemonName),
      ),
      BlocProvider<PokemonEvolutionsCubit>(
          create: (context) =>
              pokemonEvolutionsCubit..getEvolutions(widget.pokemonID))
    ], child: _body(context)));
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<PokemonInfoCubit, PokemonInfoState>(
        builder: (context, pokemonInfoState) {
      if (pokemonInfoState is PokemonInfoLoadingState) {
        return CircularProgressIndicator();
      } else if (pokemonInfoState is PokemonInfoLoadedState) {
        _infoData = pokemonInfoState.data;
        return BlocBuilder<PokemonAbilitiesCubit, PokemonAbilitiesState>(
          builder: (context, abilitiesState) {
            if (abilitiesState is PokemonAbilitiesLoadedState) {
              _abilitiesData = abilitiesState.abilitiesData;

              return BlocBuilder<PokemonEvolutionsCubit,
                  PokemonEvolutionsState>(
                builder: (context, evolutionsState) {
                  if (evolutionsState is PokemonEvolutionsLoadedState) {
                    _evolutions = evolutionsState.evolutions;
                    return _content(context);
                  } else {
                    return const ErrorCasePage();
                  }
                },
              );
            } else if (abilitiesState is PokemonAbilitiesErrorState) {
              return const ErrorCasePage();
            } else {
              return Container();
            }
          },
        );
      } else if (pokemonInfoState is PokemonInfoErrorState) {
        return const ErrorCasePage();
      } else {
        return Container();
      }
    });
  }

  Widget _content(BuildContext context) {
    const double _padding = 16.0;

    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Flexible(flex: 2, child: _picture(context)),
              Flexible(flex: 2, child: _overview())
            ],
          ),
          const SizedBox(height: 16.0),
          _statistics(context)
        ],
      ),
    );
  }

  Widget _picture(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
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
          alignment: Alignment.center,
          child: Center(
            child: (_abilitiesData != null)
                ? PokemonPicture(
                    height: 250,
                    url: _abilitiesData!
                        .sprites!.other!.dreamWorld!.frontDefault
                        .toString(),
                  )
                : const Center(
                    child: Image(
                        image: Svg(
                    'assets/pokeball.svg',
                    source: SvgSource.asset,
                  ))),
          ),
        ),
      ),
    );
  }

  Widget _overview() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _pokemonName(),
          const SizedBox(
            height: 16.0,
          ),
          _statement()
        ],
      ),
    );
  }

  Widget _pokemonName() {
    const TextStyle _textStyle = TextStyle(
        fontSize: 24.0,
        fontFamily: 'Antique',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.white);
    if (_infoData != null) {
      return Text(
        _infoData!.name.toString()[0].toUpperCase() +
            _infoData!.name.toString().substring(1),
        style: _textStyle,
        textAlign: TextAlign.left,
      );
    } else {
      return const ErrorMessage(textColor: Colors.white, fontSize: 24.0);
    }
  }

  Widget _statement() {
    const TextStyle _textStyle = TextStyle(
        fontSize: 16.0,
        fontFamily: 'Antique',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.white);

    String _statement = '';
    if (_infoData != null) {
      _statement = _infoData!.flavorTextEntries![0].flavorText!;
    } else {
      _statement = "Humm... What can I say about this one...";
    }

    return Text(
      _statement,
      style: _textStyle,
    );
  }

  Widget _statistics(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 4.0, color: Theme.of(context).cardColor),
            color: const Color(0xff232323),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 15.0,
                  offset: const Offset(-10, 10))
            ]),
        child: Column(
          children: [_tabBars(context), _tabBarView(context)],
        ),
      ),
    );
  }

  Widget _tabBars(BuildContext context) {
    const _indicatorColor = Color(0xfff5e32e);
    const _labelColor = Color(0xfff5e32e);
    const _isScrollable = true;
    const _labelStyle = TextStyle(
      fontSize: 16.0,
      fontFamily: 'Antique',
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
    );

    return TabBar(
      controller: _tabController,
      tabs: _myTabs,
      indicatorColor: _indicatorColor,
      labelColor: _labelColor,
      isScrollable: _isScrollable,
      labelStyle: _labelStyle,
    );
  }

  Widget _tabBarView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: TabBarView(controller: _tabController, children: [
          SingleChildScrollView(
              child: (_infoData != null && _abilitiesData != null)
                  ? Info(_infoData, _abilitiesData)
                  : Container()),
          SingleChildScrollView(child: PokemonMoves(_abilitiesData!)),
          SingleChildScrollView(
              child: (_abilitiesData != null)
                  ? PokemonStats(_abilitiesData!)
                  : Container()),
          SingleChildScrollView(
              child: (_evolutions != null)
                  ? Evolutions(_evolutions!)
                  : const Text(
                      "No Evolutions!",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Antique',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    )),
        ]),
      ),
    );
  }
}

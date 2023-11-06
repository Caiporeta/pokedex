import 'package:pokedex/features/home/data/pokemon_list_data_service.dart';
import 'package:pokedex/features/home/domain/pokemon_list_service.dart';
import 'package:pokedex/features/home/presentation/cubit/pokemon_home_card_cubit.dart';
import 'package:pokedex/features/information/presentation/cubit/pokemon_evolutions_cubit.dart';

import 'features/information/data/pokemon_abilities_data_service.dart';
import 'features/information/data/pokemon_info_data_service.dart';
import 'features/information/domain/pokemon_abilities_service.dart';
import 'features/information/domain/pokemon_info_service.dart';
import 'features/information/presentation/cubit/pokemon_abilities_cubit.dart';
import 'features/information/presentation/cubit/pokemon_info_cubit.dart';
import 'package:get_it/get_it.dart';
import 'main.dart';

final getIt = GetIt.I;

void getSetupLocator() {
  {
    //  Pokemon info
    getIt.registerSingleton<PokemonInfoDataService>(PokemonInfoDataService(),
        signalsReady: true);
    getIt.registerSingleton<PokemonInfoService>(
        PokemonInfoService(getIt.get<PokemonInfoDataService>()),
        signalsReady: true);
    getIt.registerFactory<PokemonInfoCubit>(
        () => PokemonInfoCubit(getIt.get<PokemonInfoService>()));
  }

  {
    // Pokemon abilities
    getIt.registerSingleton<PokemonAbilitiesDataService>(
        PokemonAbilitiesDataService(),
        signalsReady: true);
    getIt.registerSingleton<PokemonAbilitiesService>(
        PokemonAbilitiesService(getIt.get<PokemonAbilitiesDataService>()),
        signalsReady: true);
    getIt.registerFactory<PokemonAbilitiesCubit>(
        () => PokemonAbilitiesCubit(getIt.get<PokemonAbilitiesService>()));
    getIt.registerFactory<PokemonEvolutionsCubit>(
        () => PokemonEvolutionsCubit(getIt.get<PokemonAbilitiesService>()));
  }

  {
    // Pokemon list cards
    getIt.registerSingleton<PokemonListDataService>(PokemonListDataService(),
        signalsReady: true);
    getIt.registerSingleton<PokemonListService>(
        PokemonListService(getIt.get<PokemonListDataService>()),
        signalsReady: true);
    getIt.registerFactory<PokemonHomeCardCubit>(
        () => PokemonHomeCardCubit(getIt.get<PokemonListService>()));
  }
}

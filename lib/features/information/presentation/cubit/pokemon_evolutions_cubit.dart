import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/data_service/response_data.dart';
import '../../domain/pokemon_abilities_service.dart';
import '../../model/evolutions.dart';

class PokemonEvolutionsCubit extends Cubit<PokemonEvolutionsState> {
  final PokemonAbilitiesService pokemonAbilitiesService;

  PokemonEvolutionsCubit(this.pokemonAbilitiesService)
      : super(const PokemonEvolutionsInitialState());

  Future<void> getEvolutions(int id) async {
    await Future.delayed(const Duration(microseconds: 0), () async {
      try {
        emit(const PokemonEvolutionsLoadingState());

        ResponseData<PokemonEvolutions> pokemonEvolutionsReturn =
            await pokemonAbilitiesService.getEvolutions(id);
        if (pokemonEvolutionsReturn.success) {
          emit(PokemonEvolutionsLoadedState(pokemonEvolutionsReturn.data!));
        } else {
          emit(PokemonEvolutionsErrorState(
              pokemonEvolutionsReturn.errorMessage));
        }
      } catch (error) {
        print(error);
        emit(PokemonEvolutionsErrorState('Error on load data'));
      }
    });
  }
}

abstract class PokemonEvolutionsState {
  const PokemonEvolutionsState();
}

class PokemonEvolutionsInitialState extends PokemonEvolutionsState {
  const PokemonEvolutionsInitialState();
}

class PokemonEvolutionsLoadingState extends PokemonEvolutionsState {
  const PokemonEvolutionsLoadingState();
}

class PokemonEvolutionsLoadedState extends PokemonEvolutionsState {
  final PokemonEvolutions? evolutions;

  PokemonEvolutionsLoadedState(this.evolutions);

  @override
  List<Object> get props {
    return [evolutions!];
  }

  @override
  bool get stringify => true;
}

class PokemonEvolutionsErrorState extends PokemonEvolutionsState
    with EquatableMixin {
  final String message;

  PokemonEvolutionsErrorState(this.message);

  @override
  List<Object> get props {
    return [message];
  }

  @override
  bool get stringify => true;
}

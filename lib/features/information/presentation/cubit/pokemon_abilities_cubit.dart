import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/information/model/move_data.dart';

import '../../../../shared/data_service/response_data.dart';
import '../../domain/pokemon_abilities_service.dart';
import '../../model/pokemon_abilities.dart';

class PokemonAbilitiesCubit extends Cubit<PokemonAbilitiesState> {
  final PokemonAbilitiesService pokemonAbilitiesService;

  PokemonAbilitiesCubit(this.pokemonAbilitiesService)
      : super(const PokemonAbilitiesInitialState());

  Future<void> fetch(String name) async {
    await Future.delayed(const Duration(microseconds: 0), () async {
      try {
        emit(const PokemonAbilitiesLoadingState());

        ResponseData<PokemonAbilities> pokemonAbilitiesReturn =
            await pokemonAbilitiesService.getPokemonAbilities(name);
        if (pokemonAbilitiesReturn.success) {
          emit(PokemonAbilitiesLoadedState(pokemonAbilitiesReturn.data!, null));
        } else {
          emit(PokemonAbilitiesErrorState(pokemonAbilitiesReturn.errorMessage));
        }
      } catch (error) {
        print(error);
        emit(PokemonAbilitiesErrorState('Error on load data'));
      }
    });
  }

  Future<MoveData?> getMoveData(String move) async {
    await Future.delayed(const Duration(microseconds: 0), () async {
      try {
        emit(const PokemonAbilitiesLoadingState());

        ResponseData<MoveData> pokemonMoveDataReturn =
            await pokemonAbilitiesService.getMoveData(move);
        if (pokemonMoveDataReturn.success) {
          emit(PokemonAbilitiesLoadedState(null, pokemonMoveDataReturn.data!));
          return pokemonMoveDataReturn.data!;
        } else {
          emit(PokemonAbilitiesErrorState(pokemonMoveDataReturn.errorMessage));
          return pokemonMoveDataReturn.errorMessage;
        }
      } catch (error) {
        print(error);
        emit(PokemonAbilitiesErrorState('Error on load data'));
        return null;
      }
    });
    return null;
  }
}

abstract class PokemonAbilitiesState {
  const PokemonAbilitiesState();
}

class PokemonAbilitiesInitialState extends PokemonAbilitiesState {
  const PokemonAbilitiesInitialState();
}

class PokemonAbilitiesLoadingState extends PokemonAbilitiesState {
  const PokemonAbilitiesLoadingState();
}

class PokemonAbilitiesLoadedState extends PokemonAbilitiesState {
  final PokemonAbilities? abilitiesData;
  final MoveData? moveData;

  PokemonAbilitiesLoadedState(this.abilitiesData, this.moveData);

  @override
  List<Object> get props {
    return [abilitiesData!, moveData!];
  }

  @override
  bool get stringify => true;
}

class PokemonAbilitiesErrorState extends PokemonAbilitiesState
    with EquatableMixin {
  final String message;

  PokemonAbilitiesErrorState(this.message);

  @override
  List<Object> get props {
    return [message];
  }

  @override
  bool get stringify => true;
}

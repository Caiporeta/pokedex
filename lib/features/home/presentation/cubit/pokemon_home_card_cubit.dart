import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/domain/pokemon_list_service.dart';
import 'package:pokedex/features/home/model/pokemon_card_model.dart';
import 'package:pokedex/features/home/model/pokemon_list_item_model.dart';
import '../../../../shared/data_service/response_data.dart';

class PokemonHomeCardCubit extends Cubit<PokemonHomeCardState> {
  final PokemonListService pokemonListService;

  PokemonHomeCardCubit(this.pokemonListService)
      : super(const PokemonHomeCardInitialState());

  Future<void> getPokemonsList() async {
    await Future.delayed(const Duration(microseconds: 0), () async {
      try {
        emit(const PokemonHomeCardLoadingState());

        ResponseData<PokemonListItemModel> pokemonListResults =
            await pokemonListService.getPokemonList();
        if (pokemonListResults.success) {
          getPokemonsCardDetails(pokemonListResults.data!);
          //emit(PokemonHomeCardLoadedState(pokemonListResults!));
        } else {
          emit(PokemonHomeCardErrorState(pokemonListResults.errorMessage));
        }
      } catch (error) {
        print(error);
        emit(PokemonHomeCardErrorState('Error on load data'));
      }
    });
  }

  Future<void> getPokemonsCardDetails(PokemonListItemModel pokemonsList) async {
    List<PokemonCardModel> pokemonsCardDetails =
        await pokemonListService.getPokemonDetails(pokemonsList);

    if (pokemonsCardDetails.isNotEmpty) {
      emit(PokemonHomeCardLoadedState(pokemonsCardDetails));
    } else {
      emit(PokemonHomeCardErrorState("Pokemons cards details empty"));
    }
  }
}

abstract class PokemonHomeCardState {
  const PokemonHomeCardState();
}

class PokemonHomeCardInitialState extends PokemonHomeCardState {
  const PokemonHomeCardInitialState();
}

class PokemonHomeCardLoadingState extends PokemonHomeCardState {
  const PokemonHomeCardLoadingState();
}

class PokemonHomeCardLoadedState extends PokemonHomeCardState {
  final List<PokemonCardModel> pokemonCards;

  PokemonHomeCardLoadedState(this.pokemonCards);

  @override
  List get props {
    return pokemonCards;
  }

  @override
  bool get stringify => true;
}

class PokemonHomeCardErrorState extends PokemonHomeCardState
    with EquatableMixin {
  final String message;

  PokemonHomeCardErrorState(this.message);

  @override
  List<Object> get props {
    return [message];
  }

  @override
  bool get stringify => true;
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/data_service/response_data.dart';
import '../../domain/pokemon_info_service.dart';
import '../../model/pokemon_info.dart';

class PokemonInfoCubit extends Cubit<PokemonInfoState> {
  final PokemonInfoService pokemonInfoService;

  PokemonInfoCubit(this.pokemonInfoService)
      : super(const PokemonInfoInitialState());

  Future<void> fetch(String url) async {
    await Future.delayed(const Duration(microseconds: 0), () async {
      try {
        emit(const PokemonInfoLoadingState());

        ResponseData<PokemonInfo> pokemonInfoReturn =
            await pokemonInfoService.getPokemonInfo(url);
        if (pokemonInfoReturn.success) {
          emit(PokemonInfoLoadedState(pokemonInfoReturn.data!));
        } else {
          emit(PokemonInfoErrorState(pokemonInfoReturn.errorMessage));
        }
      } catch (error) {
        print(error);
        emit(PokemonInfoErrorState('Error on load data'));
      }
    });
  }
}

abstract class PokemonInfoState {
  const PokemonInfoState();
}

class PokemonInfoInitialState extends PokemonInfoState {
  const PokemonInfoInitialState();
}

class PokemonInfoLoadingState extends PokemonInfoState {
  const PokemonInfoLoadingState();
}

class PokemonInfoLoadedState extends PokemonInfoState {
  final PokemonInfo data;

  PokemonInfoLoadedState(this.data);

  @override
  List<Object> get props {
    return [data];
  }

  @override
  bool get stringify => true;
}

class PokemonInfoErrorState extends PokemonInfoState with EquatableMixin {
  final String message;

  PokemonInfoErrorState(this.message);

  @override
  List<Object> get props {
    return [message];
  }

  @override
  bool get stringify => true;
}

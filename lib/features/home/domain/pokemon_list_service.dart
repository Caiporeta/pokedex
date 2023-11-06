import 'package:pokedex/features/home/data/pokemon_list_data_service.dart';
import 'package:pokedex/features/home/model/pokemon_card_model.dart';
import 'package:pokedex/features/home/model/pokemon_details_model.dart';
import 'package:pokedex/features/home/model/pokemon_list_item_model.dart';

import '../../../shared/data_service/response_data.dart';

class PokemonListService {
  PokemonListDataService dataService;

  PokemonListService(this.dataService);

  Future<ResponseData<PokemonListItemModel>> getPokemonList() async {
    return dataService.getPokemonList();
  }

  Future<List<PokemonCardModel>> getPokemonDetails(
      PokemonListItemModel pokemonList) async {
    List<PokemonCardModel> _pokemonsCards = [];
    List<PokemonListItem> _pokemonList = pokemonList.results!.sublist(0, 4);

    for (PokemonListItem pokemon in _pokemonList) {
      ResponseData<PokemonDetailsModel> response =
          await dataService.getPokemonDetail(pokemon);
      PokemonCardModel pokemonCard = PokemonCardModel(
        id: response.data!.id!,
        name: pokemon.name!,
        url: response.data!.species!.url!,
        image: response.data!.sprites!.other!.dreamWorld!.frontDefault!,
      );

      _pokemonsCards.add(pokemonCard);
    }

    return _pokemonsCards;
  }
}

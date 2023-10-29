import 'package:pokedex/features/information/model/move_data.dart';

import '../../../shared/data_service/response_data.dart';
import '../data/pokemon_abilities_data_service.dart';
import '../model/evolutions.dart';
import '../model/pokemon_abilities.dart';

class PokemonAbilitiesService {
  PokemonAbilitiesDataService dataService;

  PokemonAbilitiesService(this.dataService);

  Future<ResponseData<PokemonAbilities>> getPokemonAbilities(
      String name) async {
    return dataService.getPokemonAbilities(name);
  }

  Future<ResponseData<PokemonEvolutions>> getEvolutions(int id) async {
    return dataService.getEvolutions(id);
  }

  Future<ResponseData<MoveData>> getMoveData(String move) async {
    return dataService.getMoveData(move);
  }
}

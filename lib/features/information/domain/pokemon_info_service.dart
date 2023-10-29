import 'package:pokedex/features/information/model/pokemon_info.dart';

import '../../../shared/data_service/response_data.dart';
import '../data/pokemon_info_data_service.dart';

class PokemonInfoService {
  PokemonInfoDataService dataService;

  PokemonInfoService(this.dataService);

  Future<ResponseData<PokemonInfo>> getPokemonInfo(String url) async {
    return dataService.getPokemonInfo(url);
  }
}

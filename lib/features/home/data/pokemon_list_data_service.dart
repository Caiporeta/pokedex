import 'package:dio/dio.dart';
import 'package:pokedex/features/home/model/pokemon_details_model.dart';
import 'package:pokedex/features/home/model/pokemon_list_item_model.dart';

import '../../../shared/data_service/abstract_data_service.dart';
import '../../../shared/data_service/response_data.dart';

class PokemonListDataService extends AbstractDataService {
  Future<ResponseData<PokemonListItemModel>> getPokemonList() async {
    try {
      final dio = Dio();
      Response response = await dio
          .get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');

      final _data = PokemonListItemModel.fromJson(response.data);

      return ResponseData<PokemonListItemModel>(
          data: _data,
          success: true,
          httpCode: response.statusCode,
          httpStatusMessage: response.statusMessage);
    } on DioError catch (dioError) {
      return getDataForDioError<PokemonListItemModel>(dioError);
    }
  }

  Future<ResponseData<PokemonDetailsModel>> getPokemonDetail(
      PokemonListItem pokemon) async {
    try {
      final dio = Dio();
      final _url = pokemon.url!;
      Response response = await dio.get(_url);

      final _data = PokemonListItemModel.fromJson(response.data);

      return ResponseData<PokemonDetailsModel>(
          data: _data,
          success: true,
          httpCode: response.statusCode,
          httpStatusMessage: response.statusMessage);
    } on DioError catch (dioError) {
      return getDataForDioError<PokemonDetailsModel>(dioError);
    }
  }
}

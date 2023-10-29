import 'package:dio/dio.dart';
import 'package:pokedex/features/information/model/move_data.dart';

import '../../../shared/data_service/abstract_data_service.dart';
import '../../../shared/data_service/response_data.dart';
import '../model/evolutions.dart';
import '../model/pokemon_abilities.dart';

class PokemonAbilitiesDataService extends AbstractDataService {
  Future<ResponseData<PokemonAbilities>> getPokemonAbilities(
      String name) async {
    try {
      final dio = Dio();
      Response response = await dio
          .get('https://pokeapi.co/api/v2/pokemon/${name.toLowerCase()}');

      final _data = PokemonAbilities.fromJson(response.data);

      return ResponseData<PokemonAbilities>(
          data: _data,
          success: true,
          httpCode: response.statusCode,
          httpStatusMessage: response.statusMessage);
    } on DioError catch (dioError) {
      return getDataForDioError<PokemonAbilities>(dioError);
    }
  }

  Future<ResponseData<PokemonEvolutions>> getEvolutions(int id) async {
    try {
      final dio = Dio();
      Response response =
          await dio.get('https://pokeapi.co/api/v2/evolution-chain/$id');

      final _data = PokemonEvolutions.fromJson(response.data);

      return ResponseData<PokemonEvolutions>(
          data: _data,
          success: true,
          httpCode: response.statusCode,
          httpStatusMessage: response.statusMessage);
    } on DioError catch (dioError) {
      return getDataForDioError<PokemonEvolutions>(dioError);
    }
  }

  Future<ResponseData<MoveData>> getMoveData(String move) async {
    try {
      final dio = Dio();
      Response response = await dio.get(move);

      final _data = MoveData.fromJson(response.data);

      return ResponseData<MoveData>(
          data: _data,
          success: true,
          httpCode: response.statusCode,
          httpStatusMessage: response.statusMessage);
    } on DioError catch (dioError) {
      return getDataForDioError<MoveData>(dioError);
    }
  }
}

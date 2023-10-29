import 'package:dio/dio.dart';
import 'package:pokedex/features/information/model/pokemon_info.dart';

import '../../../shared/data_service/abstract_data_service.dart';
import '../../../shared/data_service/response_data.dart';

class PokemonInfoDataService extends AbstractDataService {
  Future<ResponseData<PokemonInfo>> getPokemonInfo(String url) async {
    try {
      final dio = Dio();
      Response response = await dio.get(url);

      final _data = PokemonInfo.fromJson(response.data);

      return ResponseData<PokemonInfo>(
          data: _data,
          success: true,
          httpCode: response.statusCode,
          httpStatusMessage: response.statusMessage);
    } on DioError catch (dioError) {
      return getDataForDioError<PokemonInfo>(dioError);
    }
  }
}

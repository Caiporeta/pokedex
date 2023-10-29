import 'package:dio/dio.dart';
import 'package:pokedex/shared/data_service/response_data.dart';

abstract class AbstractDataService {
  Future<ResponseData<T>> getDataForDioError<T>(DioError dioError) async {
    print('dioError: ' + dioError.response!.data!.toString());

    return ResponseData<T>(
        data: null,
        success: false,
        httpCode: dioError.response != null ? dioError.response!.statusCode : 0,
        errorMessage: (dioError.response != null &&
                dioError.response!.data["errorMessage"] != null)
            ? dioError.response!.data["errorMessage"]
            : dioError.message,
        errorCode: (dioError.response != null &&
                dioError.response!.data["errorCode"] != null)
            ? dioError.response!.data["errorCode"]
            : "",
        httpStatusMessage:
            dioError.response != null ? dioError.response!.statusMessage : '');
  }
}

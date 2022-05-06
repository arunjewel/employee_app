import 'package:dio/dio.dart';

import '../model/basic/api_response.dart';
import '../model/basic/errors.dart';

class ApiConfig {
  final Dio client;

  ApiConfig({
    required this.client,
  });

  Future<ApiResponse> getData({
    required String endpointUrl,
  }) async {
    try {
      Response result = await client.get(
        endpointUrl,
        options: Options(
          contentType: Headers.textPlainContentType,
          responseType: ResponseType.plain,
          receiveDataWhenStatusError: true,
        ),
      );
      return ApiResponse.withSuccess(result);
    } on DioError catch (dioError) {
      return ApiResponse.withError(dioError.toString());
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        code: e.toString(),
      );
      return ApiResponse.withError(err);
    }
  }
}

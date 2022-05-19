import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio(BaseOptions(baseUrl: "http://www.mocky.io/v2/"));

  Future getData(String url,
      {String errorMessage = "Oops something went wrong",
      Map<String, dynamic>? body}) async {
    try {
      final response = await dio.get(url, queryParameters: body);
      if (response.data != null) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        // print(object);
      }
      return null;
    }
  }
}

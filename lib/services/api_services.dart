import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    Response response = await _dio.post(url, data: body, options: Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: headers ?? {
        "Authorization" : "Bearer $token",
      }
    ));
    return response;
  }
}

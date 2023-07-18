import 'dart:developer';

import 'package:dio/dio.dart';
import 'generate_token.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  TokenInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await generateToken(dio);
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String newToken = await generateToken(dio);
      err.requestOptions.headers["Authorization"] = "Bearer $newToken";
      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    handler.next(err);
  }
}

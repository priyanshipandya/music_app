import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../generate_token.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor(this.dio);

  final secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await secureStorage.read(key: 'access_token');
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      secureStorage.delete(key: 'access_token');
      String? newToken = await generateToken();
      err.requestOptions.headers["Authorization"] = "Bearer $newToken";
      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    handler.next(err);
  }
}

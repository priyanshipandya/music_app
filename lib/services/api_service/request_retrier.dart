import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_practical_7/services/api_service/retry_interceptor.dart';

class RetryInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier =
      DioConnectivityRequestRetrier(dio: Dio());

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.error is SocketException) {
      debugPrint(
          "=============================IN HERE SOCKET EXCEPTION=============================");
      debugPrint(
          "=============================IN HERE SOCKET EXCEPTION=============================");
      debugPrint(
          "=============================IN HERE SOCKET EXCEPTION=============================");
      debugPrint(
          "=============================IN HERE SOCKET EXCEPTION=============================");
      debugPrint(
          "=============================IN HERE SOCKET EXCEPTION=============================");
      debugPrint(
          "=============================IN HERE SOCKET EXCEPTION============================");
      handler.resolve(
        await requestRetrier.scheduleRetryRequest(err.requestOptions),
      );
    } else if (err.response?.statusCode == 401) {
      debugPrint("IN SOCKET EXCEPTION");
      debugPrint("IN SOCKET EXCEPTION");
      debugPrint("IN SOCKET EXCEPTION");
      debugPrint("IN SOCKET EXCEPTION");
      handler.next(err);
    } else {
      debugPrint("IN SOCKET EXCEPTION ELSE");
      debugPrint("IN SOCKET EXCEPTION ELSE");
      debugPrint("IN SOCKET EXCEPTION ELSE");
      debugPrint("IN SOCKET EXCEPTION ELSE");
      handler.next(err);
    }
  }
}

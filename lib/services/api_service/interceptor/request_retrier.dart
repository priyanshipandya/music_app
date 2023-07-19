import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:provider_practical_7/services/api_service/interceptor/retry_interceptor.dart';

class RetryInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier =
      DioConnectivityRequestRetrier(dio: Dio());

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.error is SocketException) {
      handler.resolve(
        await requestRetrier.scheduleRetryRequest(err.requestOptions),
      );
    } else if (err.response?.statusCode == 401) {
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}

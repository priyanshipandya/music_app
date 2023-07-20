import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:provider_practical_7/services/api_service/interceptor/retry_interceptor.dart';
import 'package:shimmer/shimmer.dart';

class RetryInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier =
      DioConnectivityRequestRetrier(dio: Dio());

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.error is SocketException && err.type == DioExceptionType.unknown) {
      handler.resolve(
        await requestRetrier.scheduleRetryRequest(err.requestOptions),
      );
    } else {
      handler.next(err);
    }
  }
}

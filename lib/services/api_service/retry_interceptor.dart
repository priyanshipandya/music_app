import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider_practical_7/services/api_service/request_retrier.dart';

class RetryInterceptor extends Interceptor {
  final RequestRetrier requestRetrier;

  RetryInterceptor(this.requestRetrier);

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    log(err.toString(), name: "ERROR TYPE");
    if (err.type == DioExceptionType.connectionError &&
            err.type is SocketException &&
        err.type == DioExceptionType.unknown) {
      try {
        print("Request interceptor");
        return requestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
    return err;
  }
}

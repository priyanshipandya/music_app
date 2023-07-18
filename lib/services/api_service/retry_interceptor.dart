import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:provider_practical_7/services/api_service/request_retrier.dart';

class RetryInterceptor extends InterceptorsWrapper {
  final RequestRetrier requestRetrier;

  RetryInterceptor(this.requestRetrier);

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    log('$err', name: "ERROR TYPE");
    if (err.type == DioExceptionType.unknown && err.error is SocketException) {
      try {

        print("Request interceptor");
        handler.resolve(await RequestRetrier(Dio(), Connectivity())
            .scheduleRequestRetry(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
    }
    log("NO ERROR IN REQUEST INTERCEPTOR",
        name: "NO ERROR IN REQUEST INTERCEPTOR");
    handler.next(err);
  }
}

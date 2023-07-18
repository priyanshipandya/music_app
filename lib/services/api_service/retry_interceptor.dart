// import 'dart:developer';
// import 'dart:io';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:provider_practical_7/services/api_service/request_retrier.dart';
//
// class RetryInterceptor extends InterceptorsWrapper {
//   final RequestRetrier requestRetrier;
//
//   RetryInterceptor(this.requestRetrier);
//
//   @override
//   Future onError(DioException err, ErrorInterceptorHandler handler) async {
//     log('$err', name: "ERROR TYPE");
//     if (err.type == DioExceptionType.unknown && err.error is SocketException) {
//       try {
//         print("Request interceptor");
//         handler.resolve(await requestRetrier.scheduleRequestRetry(err.requestOptions));
//       } on DioException catch (e) {
//         handler.next(e);
//       }
//     }
//     log("NO ERROR IN REQUEST INTERCEPTOR",
//         name: "NO ERROR IN REQUEST INTERCEPTOR");
//     handler.next(err);
//   }
// }
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetrier {
  final Connectivity connectivity = Connectivity();
  final Dio dio;

  DioConnectivityRequestRetrier({required this.dio});

  Future<Response<dynamic>> scheduleRetryRequest(
    RequestOptions requestOptions,
  ) {
    final completer = Completer<Response<dynamic>>();
    StreamSubscription<dynamic>? subscription;
    subscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          unawaited(subscription?.cancel());
          completer.complete(
            dio.request(
              requestOptions.path,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
                extra: requestOptions.extra,
              ),
              cancelToken: requestOptions.cancelToken,
            ),
          );
        }
      },
    );
    return completer.future;
  }
}

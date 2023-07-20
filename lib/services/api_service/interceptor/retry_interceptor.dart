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

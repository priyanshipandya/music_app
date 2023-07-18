import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class RequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  RequestRetrier(this.dio, this.connectivity);

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();
    debugPrint('__**********_${requestOptions.path}************---');
    streamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      log(connectivityResult.name.toString(),
          name: "CONNECTIVITY RESULT OUTSIDE");
      if (connectivityResult != ConnectivityResult.none) {
        log(connectivityResult.name.toString(),
            name: "IF CONNECTIVITY RESULT IS NOT NONE");
        responseCompleter.complete(
          dio.request(requestOptions.path,
              queryParameters: requestOptions.queryParameters,
              data: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
                extra: requestOptions.extra,
              ),
              cancelToken: requestOptions.cancelToken),
        );
      } else {
        log(connectivityResult.name.toString(),
            name: "IF CONNECTIVITY RESULT IS NONE");
        BuildContext? context = scaffoldState.currentContext;
        ScaffoldMessenger.of(context!)
            .showSnackBar(const SnackBar(content: Text("No internet Connection")));
      }
    });
    log("All OKAY",
        name: "ALL OKAY");
    streamSubscription.cancel();
    return responseCompleter.future;
  }
}

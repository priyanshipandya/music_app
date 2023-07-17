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

    streamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
          log(connectivityResult.name.toString(), name: "CONNECTIVITY RESULT OUTSIDE");
      if (connectivityResult != ConnectivityResult.none) {
        log(connectivityResult.name.toString(),
            name: "IF CONNECTIVITY RESULT IS NOT NONE");
        responseCompleter.complete(
          dio.request(requestOptions.path,
              queryParameters: requestOptions.queryParameters,
              data: requestOptions.data,
              cancelToken: requestOptions.cancelToken),
        );
      }else{
        BuildContext? context = scaffoldState.currentContext;
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("No internet Connection")));
      }
    });
    streamSubscription.cancel();
    return responseCompleter.future;
  }
}

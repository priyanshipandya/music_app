import 'package:dio/dio.dart';
import 'generate_token.dart';

class TokenInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    String token = await generateToken();
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    if(err.response?.statusCode == 401){
      String newToken = await generateToken();
      err.requestOptions.headers["Authorization"] = "Bearer $newToken";
      return handler.resolve(await Dio().fetch(err.requestOptions));
    }
  }
}
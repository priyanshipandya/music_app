import 'package:dio/dio.dart';
import 'package:provider_practical_7/api/api_service/generate_token.dart';

class TokenInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    String token = await generateToken();
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options);
  }
}
import 'dart:convert';
import 'package:dio/dio.dart';

Future<String> generateToken(dio) async {
  var client_id = '9e6e0c333de44e219dbb4ce6b6d7a1d0';
  var client_secret = 'e84966b032054bcdac175105830e26fd';

  String encodedForm = base64.encode(utf8.encode('$client_id:$client_secret')).toString();
  Map<String, dynamic> authOptions = {
    'url': 'https://accounts.spotify.com/api/token',
    'headers': {
      'Authorization':
          'Basic ${base64.encode(utf8.encode('$client_id:$client_secret'))}',
      "Content-Type": "application/x-www-form-urlencoded",
    },
    'data': {'grant_type': 'client_credentials'},
    'responseType': ResponseType.json
  };

  var dio = Dio();
  try {
    var response = await dio.post(
      authOptions['url'],
      data: authOptions['data'],
      options: Options(
        headers: authOptions['headers'],
      ),
    );

    if (response.statusCode == 200) {
      var responseBody = response.data;
      var token = responseBody['access_token'];
      print('Access token: $token');
      return token;
    } else {
      print('Request failed with status code: ${response.statusCode}');
      throw 'Request failed with status code: ${response.statusCode}';
    }
  } catch (error) {
    print('Error: $error');
    throw 'Error: $error';
  }
}

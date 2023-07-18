import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?> generateToken() async {
  var client_id = '9e6e0c333de44e219dbb4ce6b6d7a1d0';
  var client_secret = 'e84966b032054bcdac175105830e26fd';

  const secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
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

  Dio dio = Dio();
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

      var accessToken = await secureStorage.read(key: 'access_token');
      if(accessToken == null){
        var token = responseBody['access_token'];
        print('GENERATED token: $token');
        await secureStorage.write(key: 'access_token', value: token);
      }
      print('FROM SECURE STORAGE token: $accessToken');
      return accessToken;
    } else {
      throw 'Request failed with status code: ${response.statusCode}';
    }
  } catch (error) {
    throw 'Error: During generating token';
  }
}

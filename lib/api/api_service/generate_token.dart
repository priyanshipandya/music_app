import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateToken() async{
  var clientId = '9e6e0c333de44e219dbb4ce6b6d7a1d0';
  var clientSecret = 'e84966b032054bcdac175105830e26fd';

  Map<String, dynamic> authOptions = {
    'url': 'https://accounts.spotify.com/api/token',
    'headers': {
      'Authorization': 'Basic ' +
          base64.encode(utf8.encode('$clientId:$clientSecret')),
    },
    'body': {'grant_type': 'client_credentials'}
  };

  final response = await http.post(Uri.parse(authOptions['url'],),
      headers: authOptions['headers'], body: authOptions['body']);

        // log("${response.statusCode}", name: "TOKEN STATUS CODE");
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var token = body['access_token'];
      print(token);
      return token;
    }else{
      throw Exception("Problem while generating token");
    }
}

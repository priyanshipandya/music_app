import 'package:dio/dio.dart';
import 'package:provider_practical_7/api/api_service/generate_token.dart';
import 'package:retrofit/http.dart';
import '../../modal/music_modal.dart';

// part 'fetch_data.g.dart';

//
// @RestApi(baseUrl: "https://api.spotify.com/v1/artists/")
// abstract class FetchMusic{
//   factory FetchMusic(Dio dio, {String baseUrl}) = _FetchMusic;
//
//   @GET("4Z8W4fKeB5YxbusRsdQVPb")
//   Future<List<SpotifyModal>> fetchMusicApi();
//
// }

Future<T> fetchMusicApi<T>(String Url, T Function(dynamic json) parser) async {
  String token = await generateToken();
  final response = await Dio().get(
    Url,
    options: Options(
      headers: {
        'Authorization':
            'Bearer $token',
      },
    ),
  );
  // if (response.statusCode == 401) {
  //   token = generateToken();
  //   print("Token generated: $token");
  // }
  if (response.statusCode == 200) {
    return parser(response.data);
  } else {
    print(response.statusCode);
    throw Exception("${response.statusCode}");
  }
}


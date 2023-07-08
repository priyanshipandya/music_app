import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider_practical_7/api/api_service/generate_token.dart';
import 'package:retrofit/http.dart';
import '../../modal/album_modal.dart';
import '../../modal/all_data.dart';
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

List<AllData> allResponses = [];
//
// Future<T> fetchMusicApi<T>(String Url, T Function(dynamic json) parser) async {
//   String token = await generateToken();
//   final response = await Dio().get(
//     Url,
//     options: Options(
//       headers: {
//         'Authorization':
//             'Bearer $token',
//       },
//     ),
//   );
//   if (response.statusCode == 200) {
//     allResponses.add(response);
//     print("------------------------------");
//     print(allResponses);
//     return parser(response.data);
//   } else {
//     print(response.statusCode);
//     throw Exception("${response.statusCode}");
//   }
// }

// Future<SpotifyAlbum> fetchMusicAlbum(String Url) async {
//   String token = await generateToken();
//   final response = await Dio().get(
//     Url,
//     options: Options(
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     ),
//   );
//   List<String> ids = [];
//   late List<String> songs = [];
//   List<String> uri = [];
//   String? poster;
//   if (response.statusCode == 200) {
//     SpotifyAlbum albumResult = SpotifyAlbum.fromJson(response.data);
//     List<Album> albums = [];
//     for (var album = 0; album < albumResult.albums!.length; album++) {
//       for (var item = 0;
//           item < albumResult.albums![album].tracks!.items!.length;
//           item++) {
//         songs.add(
//             albumResult.albums![album].tracks!.items![item].name.toString());
//         uri.add(albumResult.albums![album].tracks!.items![item].uri.toString());
//         ids.add(albumResult.albums![album].tracks!.items![item].id.toString());
//       }
//
//       poster = albumResult.albums![album].images?[1].url.toString();
//     }
//
//     allData.add(
//         AllData(ids, songs, songs, poster!, uri));
//
//     return albumResult;
//   } else {
//     print(response.statusCode);
//     throw Exception("${response.statusCode}");
//   }
// }

Future<SpotifyAlbum> fetchMusicAlbum(String Url) async {
  String token = await generateToken();
  final response = await Dio().get(
    Url,
    options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ),
  );
  late List<AllItems> allItems;
  if (response.statusCode == 200) {
    SpotifyAlbum albumResult = SpotifyAlbum.fromJson(response.data);
    for (var album = 0; album < albumResult.albums!.length; album++) {
      allItems = [];
      var itemAt = albumResult.albums![album].tracks!.items!;
      for (var item = 0; item < itemAt.length; item++) {
        String id = itemAt[item].id.toString();
        String songName = itemAt[item].name.toString();
        String songUrl = itemAt[item].uri.toString();
        allItems.add(AllItems(id: id, songName: songName, songUrl: songUrl));
      }
      String poster =
          albumResult.albums![album].images?[1].url.toString() ?? "";
      allData.add(AllData(allItems, poster));
      // log(allData.first.items[0].songName, name: "DATA CONTAIN");
      // log(allData.length.toString(), name: "DATA LENGTH");
    }
    return albumResult;
  } else {
    print(response.statusCode);
    throw Exception("${response.statusCode}");
  }
}

Future<SpotifyModal> fetchMusicTrack(String Url) async {
  String token = await generateToken();
  final response = await Dio().get(
    Url,
    options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ),
  );
  if (response.statusCode == 200) {
    return SpotifyModal.fromJson(response.data);
  } else {
    print(response.statusCode);
    throw Exception("${response.statusCode}");
  }
}

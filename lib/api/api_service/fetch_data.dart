import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/api/api_service/generate_token.dart';
import '../../modal/album_modal.dart';
import '../../modal/all_data.dart';
import '../../modal/artist_modal.dart';
import '../../modal/music_modal.dart';

part 'fetch_data.g.dart';

class FetchAPIDatas = _FetchAPIDatas with _$FetchAPIDatas;

abstract class _FetchAPIDatas with Store {
  @observable
  ObservableFuture<List<AllData>>? callAbumAPI;
  ObservableFuture<List<AllData>>? callTrackAPI;
  ObservableFuture<List<AllData>>? callArtistAPI;

  _FetchAPIDatas() {
    callAbumAPI = ObservableFuture<List<AllData>>(fetchMusicAlbum(
        "https://api.spotify.com/v1/albums?ids=5gQZvWM1o8NkQndueJtZcP,2VP96XdMOKTXefI8Nui23s,5fy0X0JmZRZnVa2UEicIOl,1xn54DMo2qIqBuMqHtUsFd,3Lp4JKk2ZgNkybMRS3eZR5,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc"));

    callTrackAPI = ObservableFuture<List<AllData>>(fetchMusicTrack(
        "https://api.spotify.com/v1/tracks?ids=7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B"));

    callArtistAPI = ObservableFuture<List<AllData>>(fetchMusicArtist(
        "https://api.spotify.com/v1/artists?ids=6VuMaDnrHyPL1p4EHjYLi7,04gDigrS5kc9YWfZHwBETP,2CIMQHirSU0MQqyYHq0eOx%2C57dN52uHvrHOxijzpIgu3E%2C1vCWHaC5f2uS3yhpwWbIA6"));
  }

  @action
  Future<List<AllData>> fetchMusicAlbum(String Url) async {
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
    late List<Artist> artistList;
    if (response.statusCode == 200) {
      SpotifyAlbum albumResult = SpotifyAlbum.fromJson(response.data);
      for (var album = 0; album < albumResult.albums!.length; album++) {
        allItems = [];
        var itemAt = albumResult.albums![album].tracks!.items!;

        for (var item = 0; item < itemAt.length; item++) {
          String id = itemAt[item].id.toString();
          String songName = itemAt[item].name.toString();
          String songUrl = itemAt[item].uri.toString();
          int? songDuration = itemAt[item].durationMs;
          log("Duration: ${itemAt[item].durationMs}", name: "DURATIONSS");
          artistList = [];
          int itemLength = itemAt[item].artists?.length ?? 0;
          for (var artist = 0; artist < itemLength; artist++) {
            var artistName = itemAt[item].artists?[artist].name.toString();
            var artistType = itemAt[item].artists?[artist].type.toString();
            artistList.add(Artist(artistName, artistType));
          }
          allItems.add(
            AllItems(
              id: id,
              songName: songName,
              songUrl: songUrl,
              isFav: false,
              artists: artistList,
              songDurationInMs: songDuration,
            ),
          );
        }
        String poster =
            albumResult.albums![album].images?[1].url.toString() ?? "";
        String songCreator =
            albumResult.albums?[album].label ?? "Unknown Records";
        String cardsLabel =
            albumResult.albums?[album].name ?? "Unknown Records";
        allData.add(AllData(1, allItems, poster, songCreator, cardsLabel));
      }
    } else {
      print(response.statusCode);
      throw Exception("${response.statusCode}");
    }

    log(allData.length.toString(), name: "ALL DATA LENGTH ALBUM");
    return allData;
  }

  @action
  Future<List<AllData>> fetchMusicTrack(String Url) async {
    String token = await generateToken();
    final response = await Dio().get(
      Url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    List<AllItems> allItems = [];
    late List<Artist> artistList;
    log(response.statusCode.toString(), name: "STATUS CODE OF TRACK");

    if (response.statusCode == 200) {
      SpotifyModal trackResult = SpotifyModal.fromJson(response.data);
      int trackLength = trackResult.tracks?.length ?? 0;

      log(trackLength.toString(), name: "TRACK LENGTH");

      for (var track = 0; track < trackLength; track++) {
        var itemAt = trackResult.tracks?[track];

        var id = itemAt?.id ?? "";
        var songName = itemAt?.name ?? "";
        var songUrl = itemAt?.uri ?? "";
        var itemAtType = itemAt?.type ?? "";
        artistList = [];
        var artistName;
        var artistType;
        int itemLength = trackResult.tracks?[track].artists?.length ?? 0;
        for (var artist = 0; artist < itemLength; artist++) {
          artistName =
              trackResult.tracks?[track].artists?[artist].name.toString();
          artistType =
              trackResult.tracks?[track].artists?[artist].type.toString();
          artistList.add(Artist(artistName, artistType));
        }

        log(allItems.length.toString(), name: "ALL ITEMS LENGTH");

        String poster = itemAt?.album?.images?[1].url ?? "";
        String songCreator = itemAt?.name ?? "Unknown Records";
        String cardsLabel = itemAt?.type ?? "Unknown Records";

        allItems.add(
          AllItems(
            id: id,
            songName: songName,
            songUrl: songUrl,
            isFav: false,
            artists: artistList,
          ),
        );
        allData
            .add(AllData(0, [allItems.last], poster, cardsLabel, songCreator));
      }
    } else {
      throw Exception("FROM TRACK");
    }
    log(allData.length.toString(), name: "ALL DATA LENGTH");
    return allData;
  }

  @action
  Future<List<AllData>> fetchMusicArtist(String Url) async {
    String token = await generateToken();
    final response = await Dio().get(
      Url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    // List<AllItems> allItems = [];
    List<AllItems> artistList = [];
    log(response.statusCode.toString(), name: "STATUS CODE OF ARTIST");

    if (response.statusCode == 200) {
      ArtistModal artistResult = ArtistModal.fromJson(response.data);
      int artistLength = artistResult.artists?.length ?? 0;

      log(artistLength.toString(), name: "ARTIST LENGTH");

      for (var artists = 0; artists < artistLength; artists++) {
        var id = artistResult.artists?[artists].id ?? "";
        var songName = artistResult.artists?[artists].name ?? "";
        var songUrl =
            artistResult.artists?[artists].externalUrls?.spotify ?? "";
        // var itemAtType = itemAt?.type ?? "";
        // artistList = [];
        var artistName;
        var artistType;
        int genreLength = artistResult.artists?[artists].genres?.length ?? 0;
        List genreList = [];
        for(int i = 0; i < genreLength; i++){
          genreList.add(artistResult.artists?[artists].genres?[i]);
        }

        log(genreLength.toString() ?? "", name: "Genre LENGTH");
        String poster = artistResult.artists?[artists].images?[1].url ?? "";
        String songCreator =
            artistResult.artists?[artists].name ?? "Unknown Records";
        String cardsLabel =
            artistResult.artists?[artists].name ?? "Unknown Records";

        artistList.add(
          AllItems(
            id: id,
            songName: songName,
            songUrl: songUrl,
            isFav: false,
            // artists: genreList,
          ),
        );
        allData
            .add(AllData(2, artistList, poster, cardsLabel, songCreator));
      }
    } else {
      throw Exception("FROM ARTIST");
    }
    log(allData.length.toString(), name: "ALL DATA LENGTH");
    return allData;
  }
}

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

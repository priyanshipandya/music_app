import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/api/api_service/generate_token.dart';
import 'package:provider_practical_7/api/api_service/parsing_data_for_local_storage.dart';
import 'package:provider_practical_7/api/api_service/token_interceptor.dart';
import '../../modal/album_modal.dart';
import '../../modal/all_data.dart';
import '../../modal/artist_item_modal.dart';
import '../../modal/artist_modal.dart';
import '../../modal/music_modal.dart';

part 'fetch_data.g.dart';

class FetchAPIDatas = _FetchAPIDatas with _$FetchAPIDatas;

abstract class _FetchAPIDatas with Store {
  @observable
  ObservableFuture<SpotifyAlbum>? callAbumAPI;

  @observable
  ObservableFuture<SpotifyModal>? callTrackAPI;

  @observable
  ObservableFuture<ArtistModal>? callArtistAPI;

  _FetchAPIDatas() {
    callAbumAPI = ObservableFuture(
      fetchAllAPI<SpotifyAlbum>(
          "https://api.spotify.com/v1/albums?ids=5gQZvWM1o8NkQndueJtZcP,2VP96XdMOKTXefI8Nui23s,5fy0X0JmZRZnVa2UEicIOl,1xn54DMo2qIqBuMqHtUsFd,3Lp4JKk2ZgNkybMRS3eZR5,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc",
          (json) => SpotifyAlbum.fromJson(json)),
    );

    callTrackAPI = ObservableFuture(fetchAllAPI<SpotifyModal>(
        "https://api.spotify.com/v1/tracks?ids=7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B",
        (json) => SpotifyModal.fromJson(json)));

    callArtistAPI = ObservableFuture(fetchAllAPI<ArtistModal>(
        "https://api.spotify.com/v1/artists?ids=6VuMaDnrHyPL1p4EHjYLi7,04gDigrS5kc9YWfZHwBETP,2CIMQHirSU0MQqyYHq0eOx%2C57dN52uHvrHOxijzpIgu3E%2C1vCWHaC5f2uS3yhpwWbIA6",
        (json) => ArtistModal.fromJson(json)));
  }

  @action
  Future<T> fetchAllAPI<T>(String url, T Function(dynamic json) parser) async {
    Dio dio = Dio();
    try {
      dio.interceptors.add(TokenInterceptor());
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        T result = parser(response.data);
        parseDataForStoringLocally(result);
        return result;
      } else {
        print(response.statusCode);
        throw Exception("${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Failed to fetch data from $url');
    }
  }
}

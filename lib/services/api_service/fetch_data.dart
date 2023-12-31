import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/services/api_service/interceptor/request_retrier.dart';
import 'package:provider_practical_7/services/api_service/interceptor/token_interceptor.dart';
import 'package:provider_practical_7/services/api_service/parsing_data_for_local_storage.dart';
import '../../modal/album.dart';
import '../../modal/artist.dart';
import '../../modal/music.dart';
import '../../values/strings.dart';
import '../../values/urls.dart';

part 'fetch_data.g.dart';

class FetchAPIDatas = _FetchAPIDatas with _$FetchAPIDatas;

abstract class _FetchAPIDatas with Store {
  @observable
  ObservableFuture<SpotifyAlbum>? callAbumAPI;

  @observable
  ObservableFuture<SpotifyModal>? callTrackAPI;

  @observable
  ObservableFuture<ArtistModal>? callArtistAPI;

  Dio dio = Dio(BaseOptions(baseUrl: Urls.baseUrl));

  _FetchAPIDatas() {
    callAbumAPI = ObservableFuture(
      fetchAllAPI<SpotifyAlbum>(
          Urls.spotifyAlbumAPI, (json) => SpotifyAlbum.fromJson(json)),
    );

    callTrackAPI = ObservableFuture(
      fetchAllAPI<SpotifyModal>(
        Urls.spotifyTrackAPI,
        (json) => SpotifyModal.fromJson(json),
      ),
    );

    callArtistAPI = ObservableFuture(
      fetchAllAPI<ArtistModal>(
        Urls.spotifyArtistAPI,
        (json) => ArtistModal.fromJson(json),
      ),
    );
  }

  @action
  Future<T> fetchAllAPI<T>(String url, T Function(dynamic json) parser) async {
    try {
      dio.interceptors.addAll([TokenInterceptor(dio), RetryInterceptor()]);
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        T result = parser(response.data);
        parseDataForStoringLocally(result);
        return result;
      } else {
        debugPrint(response.statusCode.toString());
        throw Exception("${response.statusCode}");
      }
    } catch (e) {
      throw Exception('${Strings.urlFetchingFailed} $url');
    }
  }
}

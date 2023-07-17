import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/api/api_service/parsing_data_for_local_storage.dart';
import 'package:provider_practical_7/api/api_service/token_interceptor.dart';

import '../../modal/album_modal.dart';
import '../../modal/artist_modal.dart';
import '../../modal/music_modal.dart';
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

  _FetchAPIDatas() {
    callAbumAPI = ObservableFuture(
      fetchAllAPI<SpotifyAlbum>(
          Urls.spotifyAlbumAPI,
          (json) => SpotifyAlbum.fromJson(json)),
    );

    callTrackAPI = ObservableFuture(fetchAllAPI<SpotifyModal>(
        Urls.spotifyTrackAPI,
        (json) => SpotifyModal.fromJson(json)));

    callArtistAPI = ObservableFuture(fetchAllAPI<ArtistModal>(
        Urls.spotifyArtistAPI,
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
      throw Exception('${Strings.urlFetchingFailed} $url');
    }
  }
}

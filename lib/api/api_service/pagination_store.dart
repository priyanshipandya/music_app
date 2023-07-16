import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/api/api_service/token_interceptor.dart';

import '../../modal/artist_item_modal.dart';

part 'pagination_store.g.dart';

class PaginationStore = _PaginationStore with _$PaginationStore;

abstract class _PaginationStore with Store{
  @observable
  ObservableList<Items> allArtistItems = ObservableList<Items>();

  @observable
  int currentPage = 1;

  @observable
  bool hasMoreData = true;

  @observable
  int itemsPerPage = 10;

  @action
  // Future<void> fetchAtistAlbum(String _url) async {
  Future<List<Items>> fetchNextPage(String artistId) async {
    Dio dio = Dio();

    final offset = (currentPage - 1) * itemsPerPage;
    print("$offset");
    final limit = itemsPerPage;
    print("$limit");
    String url = 'https://api.spotify.com/v1/artists/$artistId/albums';
    try {
      dio.interceptors.add(TokenInterceptor());
      final response = await dio.get(url, queryParameters: {
        "offset": offset,
        "limit" : limit,
      });

      log(response.statusCode.toString(), name: "STATUS CODE");
      if (response.statusCode == 200) {

        final data = response.data;
        final itemsData = data['items'];

        final List<Items> items = itemsData
            .map<Items>((itemData) => Items.fromJson(itemData))
            .toList();

        allArtistItems.addAll(items);
        currentPage++;
        log(allArtistItems.toString(), name: "ALL ARTIST ITEM LENGTH");
        print("currentPage, $currentPage");
        final hasNextPage = data['next'] != null;
        log(data['next'], name: "has next ");
        hasMoreData = hasNextPage;
        log(hasMoreData.toString(), name: "has more data");

        return items;
        // return ArtistItemModal.fromJson(data);
      } else {
        throw Exception("Token generation error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

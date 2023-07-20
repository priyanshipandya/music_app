import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/services/api_service/interceptor/token_interceptor.dart';

import '../modal/artist_item.dart';

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

  @observable
  bool isLoading = false;

  @action
  Future<List<Items>> fetchNextPage(String artistId, Dio dio) async {


    final offset = (currentPage - 1) * itemsPerPage;
    final limit = itemsPerPage;
    String url = 'https://api.spotify.com/v1/artists/$artistId/albums';
    try {
      dio.interceptors.add(TokenInterceptor(dio));
      final response = await dio.get(url, queryParameters: {
        "offset": offset,
        "limit" : limit,
      });

      if (response.statusCode == 200) {

        final data = response.data;
        final itemsData = data['items'];

        final List<Items> items = itemsData
            .map<Items>((itemData) => Items.fromJson(itemData))
            .toList();

        allArtistItems.addAll(items);
        currentPage++;
        bool hasNextPage = data['next'] != null;
        hasMoreData = hasNextPage;
        return items;
      } else {
        throw Exception("Token generation error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

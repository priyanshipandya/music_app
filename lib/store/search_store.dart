import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/modal/search.dart';

import '../values/urls.dart';

part 'search_store.g.dart';

class SearchApi = _SearchApi with _$SearchApi;

abstract class _SearchApi with Store {
  final Dio _dio = Dio(BaseOptions(baseUrl: Urls.baseUrl));

  @observable
  ObservableList<Items> searchResults = ObservableList<Items>();

  Timer? _debounce;

  @action
  Future<void> searchAlbums(String query) async {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 700), () async {
      var secureStorage = const FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true));
      var token = await secureStorage.read(key: 'access_token');
      final response = await _dio.get(
        'search',
        queryParameters: {'q': '$query', 'type': 'album'},
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        final albumsData = response.data['albums']['items'] as List;
        debugPrint(albumsData.toString());
        debugPrint("==================${albumsData.toString()}=================");
        debugPrint("==================${albumsData.toString()}=================");
        debugPrint("==================${albumsData.toString()}=================");
        searchResults.clear();
        for (var item in albumsData) {
          searchResults.add(Items.fromJson(item));
        }
        debugPrint("==================${albumsData[0].name}=================");
        debugPrint("==================${albumsData.toString()}=================");
        debugPrint("=====SEARCH RESLTS=============${searchResults.toString()}=================");

      } else {
        throw Exception('Failed to load tracks');
      }
    });
  }
}

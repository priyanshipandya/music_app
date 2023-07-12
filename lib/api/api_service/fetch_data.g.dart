// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchAPIDatas on _FetchAPIDatas, Store {
  late final _$callAbumAPIAtom =
      Atom(name: '_FetchAPIDatas.callAbumAPI', context: context);

  @override
  ObservableFuture<List<AllData>>? get callAbumAPI {
    _$callAbumAPIAtom.reportRead();
    return super.callAbumAPI;
  }

  @override
  set callAbumAPI(ObservableFuture<List<AllData>>? value) {
    _$callAbumAPIAtom.reportWrite(value, super.callAbumAPI, () {
      super.callAbumAPI = value;
    });
  }

  late final _$fetchMusicAlbumAsyncAction =
      AsyncAction('_FetchAPIDatas.fetchMusicAlbum', context: context);

  @override
  Future<List<AllData>> fetchMusicAlbum(String Url) {
    return _$fetchMusicAlbumAsyncAction.run(() => super.fetchMusicAlbum(Url));
  }

  late final _$fetchMusicTrackAsyncAction =
      AsyncAction('_FetchAPIDatas.fetchMusicTrack', context: context);

  @override
  Future<List<AllData>> fetchMusicTrack(String Url) {
    return _$fetchMusicTrackAsyncAction.run(() => super.fetchMusicTrack(Url));
  }

  @override
  String toString() {
    return '''
callAbumAPI: ${callAbumAPI}
    ''';
  }
}

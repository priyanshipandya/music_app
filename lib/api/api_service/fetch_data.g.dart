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
  ObservableFuture<SpotifyAlbum>? get callAbumAPI {
    _$callAbumAPIAtom.reportRead();
    return super.callAbumAPI;
  }

  @override
  set callAbumAPI(ObservableFuture<SpotifyAlbum>? value) {
    _$callAbumAPIAtom.reportWrite(value, super.callAbumAPI, () {
      super.callAbumAPI = value;
    });
  }

  late final _$callTrackAPIAtom =
      Atom(name: '_FetchAPIDatas.callTrackAPI', context: context);

  @override
  ObservableFuture<SpotifyModal>? get callTrackAPI {
    _$callTrackAPIAtom.reportRead();
    return super.callTrackAPI;
  }

  @override
  set callTrackAPI(ObservableFuture<SpotifyModal>? value) {
    _$callTrackAPIAtom.reportWrite(value, super.callTrackAPI, () {
      super.callTrackAPI = value;
    });
  }

  late final _$callArtistAPIAtom =
      Atom(name: '_FetchAPIDatas.callArtistAPI', context: context);

  @override
  ObservableFuture<ArtistModal>? get callArtistAPI {
    _$callArtistAPIAtom.reportRead();
    return super.callArtistAPI;
  }

  @override
  set callArtistAPI(ObservableFuture<ArtistModal>? value) {
    _$callArtistAPIAtom.reportWrite(value, super.callArtistAPI, () {
      super.callArtistAPI = value;
    });
  }

  late final _$fetchAllAPIAsyncAction =
      AsyncAction('_FetchAPIDatas.fetchAllAPI', context: context);

  @override
  Future<T> fetchAllAPI<T>(String url, T Function(dynamic) parser) {
    return _$fetchAllAPIAsyncAction
        .run(() => super.fetchAllAPI<T>(url, parser));
  }

  @override
  String toString() {
    return '''
callAbumAPI: ${callAbumAPI},
callTrackAPI: ${callTrackAPI},
callArtistAPI: ${callArtistAPI}
    ''';
  }
}

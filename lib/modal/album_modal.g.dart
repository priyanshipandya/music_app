// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotifyAlbum _$SpotifyAlbumFromJson(Map<String, dynamic> json) => SpotifyAlbum(
      albums: (json['albums'] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpotifyAlbumToJson(SpotifyAlbum instance) =>
    <String, dynamic>{
      'albums': instance.albums?.map((e) => e.toJson()).toList(),
    };

Albums _$AlbumsFromJson(Map<String, dynamic> json) => Albums(
      albumType: json['albumType'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableMarkets: (json['availableMarkets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      copyrights: (json['copyrights'] as List<dynamic>?)
          ?.map((e) => Copyrights.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalIds: json['externalIds'] == null
          ? null
          : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>),
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String?,
      name: json['name'] as String?,
      popularity: json['popularity'] as int?,
      releaseDate: json['releaseDate'] as String?,
      releaseDatePrecision: json['releaseDatePrecision'] as String?,
      totalTracks: json['totalTracks'] as int?,
      tracks: json['tracks'] == null
          ? null
          : Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$AlbumsToJson(Albums instance) => <String, dynamic>{
      'albumType': instance.albumType,
      'artists': instance.artists,
      'availableMarkets': instance.availableMarkets,
      'copyrights': instance.copyrights,
      'externalIds': instance.externalIds,
      'external_urls': instance.externalUrls,
      'genres': instance.genres,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'label': instance.label,
      'name': instance.name,
      'popularity': instance.popularity,
      'releaseDate': instance.releaseDate,
      'releaseDatePrecision': instance.releaseDatePrecision,
      'totalTracks': instance.totalTracks,
      'tracks': instance.tracks,
      'type': instance.type,
      'uri': instance.uri,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
    };

ExternalUrls _$ExternalUrlsFromJson(Map<String, dynamic> json) => ExternalUrls(
      spotify: json['spotify'] as String?,
    );

Map<String, dynamic> _$ExternalUrlsToJson(ExternalUrls instance) =>
    <String, dynamic>{
      'spotify': instance.spotify,
    };

Copyrights _$CopyrightsFromJson(Map<String, dynamic> json) => Copyrights(
      text: json['text'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CopyrightsToJson(Copyrights instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => ExternalIds(
      upc: json['upc'] as String?,
    );

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'upc': instance.upc,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      height: json['height'] as int?,
      url: json['url'] as String?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      href: json['href'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableMarkets: (json['availableMarkets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      discNumber: json['discNumber'] as int?,
      durationMs: json['durationMs'] as int?,
      explicit: json['explicit'] as bool?,
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String?,
      id: json['id'] as String?,
      isLocal: json['isLocal'] as bool?,
      name: json['name'] as String?,
      previewUrl: json['previewUrl'] as String?,
      trackNumber: json['trackNumber'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'artists': instance.artists,
      'availableMarkets': instance.availableMarkets,
      'discNumber': instance.discNumber,
      'durationMs': instance.durationMs,
      'explicit': instance.explicit,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'isLocal': instance.isLocal,
      'name': instance.name,
      'previewUrl': instance.previewUrl,
      'trackNumber': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri,
    };

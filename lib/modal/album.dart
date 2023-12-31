import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class SpotifyAlbum {
  List<Albums>? albums;

  SpotifyAlbum({this.albums});

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) =>
      _$SpotifyAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$SpotifyAlbumToJson(this);
}

@JsonSerializable()
class Albums {
  String? albumType;
  List<Artists>? artists;
  ExternalIds? externalIds;
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  List<String>? genres;
  String? href;
  String? id;
  List<Images>? images;
  String? label;
  String? name;
  Tracks? tracks;
  String? type;
  String? uri;

  Albums(
      {this.albumType,
      this.artists,
      this.externalIds,
      this.externalUrls,
      this.genres,
      this.href,
      this.id,
      this.images,
      this.label,
      this.name,
      this.tracks,
      this.type,
      this.uri});

  factory Albums.fromJson(Map<String, dynamic> json) => _$AlbumsFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsToJson(this);
}

@JsonSerializable()
class Artists {
  @JsonKey(name: "external_urls")
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) =>
      _$ExternalUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
}


@JsonSerializable()
class ExternalIds {
  String? upc;

  ExternalIds({this.upc});

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);
}

@JsonSerializable()
class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Tracks {
  String? href;
  List<Items>? items;
  int? limit;

  // Null? next;
  int? offset;

  // Null? previous;
  int? total;

  Tracks(
      {this.href,
      this.items,
      this.limit,
      // this.next,
      this.offset,
      // this.previous,
      this.total});

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

  Map<String, dynamic> toJson() => _$TracksToJson(this);
}

@JsonSerializable()
class Items {
  List<Artists>? artists;
  @JsonKey(name: "duration_ms")
  int? durationMs;
  @JsonKey(name: "external_urls")
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  Items({
    this.artists,
    this.durationMs,
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

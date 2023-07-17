// import 'package:json_annotation/json_annotation.dart';
//
import 'package:json_annotation/json_annotation.dart';

part 'music_modal.g.dart';

@JsonSerializable(explicitToJson: true)
class SpotifyModal {
  List<Tracks>? tracks;

  SpotifyModal({this.tracks});

  factory SpotifyModal.fromJson(Map<String, dynamic> json) => _$SpotifyModalFromJson(json);
  Map<String, dynamic> toJson() => _$SpotifyModalToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tracks {
  Album? album;
  List<Artists>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  String? name;
  int? popularity;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  Tracks(
      {this.album,
        this.artists,
        this.availableMarkets,
        this.discNumber,
        this.durationMs,
        this.explicit,
        this.externalIds,
        this.externalUrls,
        this.href,
        this.id,
        this.isLocal,
        this.name,
        this.popularity,
        this.previewUrl,
        this.trackNumber,
        this.type,
        this.uri});

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);
  Map<String, dynamic> toJson() => _$TracksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Album {
  String? albumType;
  List<Artists>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  Album(
      {this.albumType,
        this.artists,
        this.availableMarkets,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.releaseDate,
        this.releaseDatePrecision,
        this.totalTracks,
        this.type,
        this.uri});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Artists {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  factory Artists.fromJson(Map<String, dynamic> json) => _$ArtistsFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
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
class ExternalIds {
  String? isrc;

  ExternalIds({this.isrc});

  factory ExternalIds.fromJson(Map<String, dynamic> json) => _$ExternalIdsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistModal {
  List<Artists>? artists;

  ArtistModal({this.artists});

  factory ArtistModal.fromJson(Map<String, dynamic> json) => _$ArtistModalFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistModalToJson(this);
}

@JsonSerializable()
class Artists {
  ExternalUrls? externalUrls;
  List<String>? genres;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  Artists({this.externalUrls,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri});

  factory Artists.fromJson(Map<String, dynamic> json) => _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});


  factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);

}


@JsonSerializable()
class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

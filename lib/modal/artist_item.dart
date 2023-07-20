import 'package:json_annotation/json_annotation.dart';

part 'artist_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistItemModal {
  String? href;
  List<Items>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  ArtistItemModal(
      {this.href,
        this.items,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total});

  factory ArtistItemModal.fromJson(Map<String, dynamic> json) => _$ArtistItemModalFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistItemModalToJson(this);
}

@JsonSerializable()
class Items {
  String? albumGroup;
  String? albumType;
  List<Artists>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  int? totalTracks;
  String? type;
  String? uri;

  Items(
      {this.albumGroup,
        this.albumType,
        this.artists,
        this.availableMarkets,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.totalTracks,
        this.type,
        this.uri});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
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

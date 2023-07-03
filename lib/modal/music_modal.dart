// import 'package:json_annotation/json_annotation.dart';
//
// part 'music_modal.g.dart';
class SpotifyModal {
  List<Tracks>? tracks;

  SpotifyModal({this.tracks});

  SpotifyModal.fromJson(Map<String, dynamic> json) {
    if (json['tracks'] != null) {
      tracks = <Tracks>[];
      json['tracks'].forEach((v) {
        tracks!.add(new Tracks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

  Tracks.fromJson(Map<String, dynamic> json) {
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    availableMarkets = json['available_markets'].cast<String>();
    discNumber = json['disc_number'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalIds = json['external_ids'] != null
        ? new ExternalIds.fromJson(json['external_ids'])
        : null;
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    isLocal = json['is_local'];
    name = json['name'];
    popularity = json['popularity'];
    previewUrl = json['preview_url'];
    trackNumber = json['track_number'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['available_markets'] = this.availableMarkets;
    data['disc_number'] = this.discNumber;
    data['duration_ms'] = this.durationMs;
    data['explicit'] = this.explicit;
    if (this.externalIds != null) {
      data['external_ids'] = this.externalIds!.toJson();
    }
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['is_local'] = this.isLocal;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['preview_url'] = this.previewUrl;
    data['track_number'] = this.trackNumber;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

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

  Album.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    availableMarkets = json['available_markets'].cast<String>();
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_type'] = this.albumType;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['available_markets'] = this.availableMarkets;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    data['total_tracks'] = this.totalTracks;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class Artists {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  Artists.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class ExternalIds {
  String? isrc;

  ExternalIds({this.isrc});

  ExternalIds.fromJson(Map<String, dynamic> json) {
    isrc = json['isrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isrc'] = this.isrc;
    return data;
  }
}




// @JsonSerializable(explicitToJson: true)
// class SpotifyModal {
//   ExternalUrls? externalUrls;
//   Followers? followers;
//   List<String>? genres;
//   String? href;
//   String? id;
//   List<Images>? images;
//   String? name;
//   int? popularity;
//   String? type;
//   String? uri;
//
//   SpotifyModal(
//       {this.externalUrls,
//         this.followers,
//         this.genres,
//         this.href,
//         this.id,
//         this.images,
//         this.name,
//         this.popularity,
//         this.type,
//         this.uri});
//
//   factory SpotifyModal.fromJson(Map<String, dynamic> json) => _$SpotifyModalFromJson(json);
//   Map<String, dynamic> toJson() => _$SpotifyModalToJson(this);
// }
//
//
// @JsonSerializable()
// @JsonSerializable()
// class ExternalUrls {
//   String? spotify;
//
//   ExternalUrls({this.spotify});
//
//   factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);
//   Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
// }
//
// @JsonSerializable()
// class Followers {
//   String? href;
//   int? total;
//
//   Followers({this.href, this.total});
//
//   factory Followers.fromJson(Map<String, dynamic> json) => _$FollowersFromJson(json);
//   Map<String, dynamic> toJson() => _$FollowersToJson(this);
// }
//
// @JsonSerializable()
// class Images {
//   int? height;
//   String? url;
//   int? width;
//
//   Images({this.height, this.url, this.width});
//
//   factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
//   Map<String, dynamic> toJson() => _$ImagesToJson(this);
// }
//
//
//
//
// // import 'package:json_annotation/json_annotation.dart';
// //
// // part 'music_modal.g.dart';
// //
// // @JsonSerializable(explicitToJson: true)
// // class MusicModal {
// //   String countryIso;
// //   String country;
// //   bool open;
// //   String pop;
// //   String uploadToken;
// //   int uploadTokenLifetime;
// //   dynamic userToken;
// //   Hosts hosts;
// //   Ads ads;
// //   bool hasPodcasts;
// //   List<dynamic> offers;
// //
// //   MusicModal({
// //     required this.countryIso,
// //     required this.country,
// //     required this.open,
// //     required this.pop,
// //     required this.uploadToken,
// //     required this.uploadTokenLifetime,
// //     this.userToken,
// //     required this.hosts,
// //     required this.ads,
// //     required this.hasPodcasts,
// //     required this.offers,
// //   });
// //
// //   factory MusicModal.fromJson(Map<String, dynamic> json) => _$MusicModalFromJson(json);
// //   Map<String, dynamic> toJson() => _$MusicModalToJson(this);
// //
// // }
// //
// // @JsonSerializable()
// // class Ads {
// //   Audio audio;
// //   Display display;
// //   BigNativeAdsHome bigNativeAdsHome;
// //
// //   Ads({
// //     required this.audio,
// //     required this.display,
// //     required this.bigNativeAdsHome,
// //   });
// //
// //   factory Ads.fromJson(Map<String, dynamic> json) => _$AdsFromJson(json);
// //   Map<String, dynamic> toJson() => _$AdsToJson(this);
// // }
// //
// // @JsonSerializable()
// // class Audio {
// //   Default audioDefault;
// //
// //   Audio({
// //     required this.audioDefault,
// //   });
// //
// //   factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
// //   Map<String, dynamic> toJson() => _$AudioToJson(this);
// //
// // }
// //
// // @JsonSerializable()
// // class Default {
// //   int start;
// //   int interval;
// //   String unit;
// //
// //   Default({
// //     required this.start,
// //     required this.interval,
// //     required this.unit,
// //   });
// //
// //   @JsonSerializable()
// //   factory Default.fromJson(Map<String, dynamic> json) => _$DefaultFromJson(json);
// //   Map<String, dynamic> toJson() => _$DefaultToJson(this);
// //
// // }
// //
// // @JsonSerializable()
// // class BigNativeAdsHome {
// //   Android iphone;
// //   Android ipad;
// //   Android android;
// //   Android androidTablet;
// //
// //   BigNativeAdsHome({
// //     required this.iphone,
// //     required this.ipad,
// //     required this.android,
// //     required this.androidTablet,
// //   });
// //
// //   factory BigNativeAdsHome.fromJson(Map<String, dynamic> json) => _$BigNativeAdsHomeFromJson(json);
// //   Map<String, dynamic> toJson() => _$BigNativeAdsHomeToJson(this);
// // }
// //
// // @JsonSerializable()
// // class Android {
// //   bool enabled;
// //
// //   Android({
// //     required this.enabled,
// //   });
// //   factory Android.fromJson(Map<String, dynamic> json) => _$AndroidFromJson(json);
// //   Map<String, dynamic> toJson() => _$AndroidToJson(this);
// //
// // }
// //
// // @JsonSerializable()
// // class Display {
// //   Default interstitial;
// //
// //   Display({
// //     required this.interstitial,
// //   });
// //
// //   factory Display.fromJson(Map<String, dynamic> json) => _$DisplayFromJson(json);
// //   Map<String, dynamic> toJson() => _$DisplayToJson(this);
// // }
// //
// // @JsonSerializable()
// // class Hosts {
// //   String stream;
// //   String images;
// //
// //   Hosts({
// //     required this.stream,
// //     required this.images,
// //   });
// //   factory Hosts.fromJson(Map<String, dynamic> json) => _$HostsFromJson(json);
// //   Map<String, dynamic> toJson() => _$HostsToJson(this);
// // }

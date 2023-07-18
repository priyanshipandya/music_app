import 'dart:developer';
import '../../modal/album_modal.dart';
import '../../modal/all_data.dart';
import '../../modal/artist_modal.dart';
import '../../modal/music_modal.dart';
import '../../values/strings.dart';

void parseDataForStoringLocally(result) {
  log(result.toString(), name: "RESULTTT");
  if (result is SpotifyAlbum) {
    for (var album = 0; album < result.albums!.length; album++) {
      List<AllItems> allItems = [];
      var itemAt = result.albums![album].tracks!.items!;
      for (var item = 0; item < itemAt.length; item++) {
        String id = itemAt[item].id.toString();
        String songName = itemAt[item].name.toString();
        String songUrl = itemAt[item].href.toString();
        int? songDuration = itemAt[item].durationMs;
        List<Artist>? artistList = [];
        int itemLength = itemAt[item].artists?.length ?? 0;
        for (var artist = 0; artist < itemLength; artist++) {
          var artistName = itemAt[item].artists?[artist].name.toString();
          var artistType = itemAt[item].artists?[artist].type.toString();
          artistList.add(Artist(artistName, artistType));
        }
        allItems.add(
          AllItems(
            id: id,
            songName: songName,
            songUrl: songUrl,
            isFav: false,
            artists: artistList,
            songDurationInMs: songDuration,
          ),
        );
      }
      String poster = result.albums![album].images?[1].url.toString() ?? "";
      String songCreator = result.albums?[album].label ?? "Unknown Records";
      String cardsLabel = result.albums?[album].name ?? "Unknown Records";
      allData.add(AllData(1, allItems, poster, songCreator, cardsLabel, null));
    }
    log(allData.length.toString(), name: "FROM ALBUM RECORDS");
  } else if (result is SpotifyModal) {
    List<AllItems> allItems = [];
    late List<Artist> artistList;
    int trackLength = result.tracks?.length ?? 0;

    for (var track = 0; track < trackLength; track++) {
      var itemAt = result.tracks?[track];
      var id = itemAt?.id ?? "";
      var songName = itemAt?.name ?? "";
      var songUrl = itemAt?.uri ?? "";
      var itemAtType = itemAt?.type ?? "";
      artistList = [];
      String? artistName;
      String? artistType;
      int itemLength = result.tracks?[track].artists?.length ?? 0;
      for (var artist = 0; artist < itemLength; artist++) {
        artistName = result.tracks?[track].artists?[artist].name.toString();
        artistType = result.tracks?[track].artists?[artist].type.toString();
        artistList.add(Artist(artistName, artistType));
      }

      String poster = itemAt?.album?.images?[1].url ?? "";
      String songCreator = itemAt?.name ?? "Unknown Records";
      String cardsLabel = itemAt?.type ?? "Unknown Records";

      allItems.add(
        AllItems(
          id: id,
          songName: songName,
          songUrl: songUrl,
          isFav: false,
          artists: artistList,
        ),
      );
      allData.add(
          AllData(0, [allItems.last], poster, cardsLabel, songCreator, null));
    }
  } else if (result is ArtistModal) {
    List<AllItems> artistList = [];
    int artistLength = result.artists?.length ?? 0;
    for (var artists = 0; artists < artistLength; artists++) {
      var id = result.artists?[artists].id ?? "";
      var songName = result.artists?[artists].name ?? "";
      var songUrl = result.artists?[artists].externalUrls?.spotify ?? "";
      String poster = result.artists?[artists].images?[1].url ?? "";
      String songCreator = result.artists?[artists].name ?? Strings.unknownRecord;
      String cardsLabel = result.artists?[artists].name ?? Strings.unknownRecord;
      String albumId = result.artists?[artists].id ?? Strings.unknownRecord;

      artistList.add(
        AllItems(
          id: id,
          songName: songName,
          songUrl: songUrl,
          isFav: false,
        ),
      );
      allData.add(
          AllData(2, artistList, poster, cardsLabel, songCreator, albumId));
    }
  }
}

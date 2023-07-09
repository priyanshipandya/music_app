class AllData {
  int cardNo;
  List<AllItems> items;
  String poster;
  String? songCreater;
  String? albumLabelName;

  AllData(this.cardNo, this.items, this.poster, this.songCreater, this.albumLabelName);
}

class AllItems {
  String id;
  String songName;
  String songUrl;
  bool? isFav = false;
  List<Artist>? artists;

  AllItems(
      {required this.id,
      required this.songName,
      required this.songUrl,
      this.isFav,
      this.artists});
}

class Artist {
  String? name;
  String? type;

  Artist(this.name, this.type);
}

List<AllData> allData = [];

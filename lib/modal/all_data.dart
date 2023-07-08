class AllData {
  List<AllItems> items;
  String poster;

  AllData(this.items, this.poster);
}

class AllItems {

  String id;
  String songName;
  // String songCreater;
  String songUrl;
  bool? isFav = false;
  AllItems({required this.id, required this.songName, required this.songUrl, this.isFav});
}

List<AllData> allData = [];

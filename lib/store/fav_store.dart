import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:provider_practical_7/store/fav_modal.dart';

import '../modal/album_modal.dart';

part 'fav_store.g.dart';

class FavStore = _FavStore with _$FavStore;

abstract class _FavStore with Store {
  @observable
  ObservableList<AllItems> favList = ObservableList();

  @computed
  int get totalNo => favList.length;

  @action
  void toggleFav(AllItems item) {
    // data.items[index].isFav = !(item?.isFav ?? false);
    item.isFav = !(item.isFav ?? false);
    log(item.isFav.toString(), name: "ITEM ISFAV");

    if (item.isFav == true) {
      favList.add(item);
    } else {
      favList.remove(item);
    }
    log(favList.toString(), name: "ITEMS LIST");
  }
}

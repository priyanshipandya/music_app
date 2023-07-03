import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/store/fav_modal.dart';

import '../modal/album_modal.dart';

part 'fav_store.g.dart';

class FavStore = _FavStore with _$FavStore;

abstract class _FavStore with Store {
  @observable
  ObservableMap<int, List<Items>> favList = ObservableMap();

  @computed
  int get totalNo => favList.length;

  @action
  void toggleFav(int idx, Items item) {
    List<Items>? myItem = favList[idx];
      if (favList.containsKey(idx)) {
        List<Items>? listAtIndex = favList[idx];
          item.isFav = !(item.isFav ?? true);

        if (listAtIndex!.isEmpty) {
          favList.remove(idx);
        } else {
          favList[idx] = listAtIndex;
        }
      } else {
        Items newItem = Items(isFav: true);
        favList[idx] = [newItem];
        // favList[idx] = myItem?.add(item);
      }

    // List<Items>? myItem = favList[idx];
    //
    // if (favList.keys.contains(idx) && favList.values.contains(items)) {
    //   myItem?.removeAt(idx);
    //   if (myItem!.isEmpty) {
    //     favList.remove(idx);
    //   } else {
    //     favList[idx] = myItem;
    //   }
    // } else {
    //
    // }
  }
}

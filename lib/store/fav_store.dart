import 'dart:developer';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/modal/all_data.dart';

part 'fav_store.g.dart';

class FavStore = _FavStore with _$FavStore;

abstract class _FavStore with Store {
  @observable
  ObservableList<AllItems> favList = ObservableList();

  @action
  void toggleFav(AllItems item) {
    item.isFav = !(item.isFav ?? false);
    if (item.isFav == true) {
      favList.add(item);
    } else {
      favList.remove(item);
    }
  }
}

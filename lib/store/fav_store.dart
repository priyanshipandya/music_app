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
  void toggleFav(AllItems item){
    item.isFav = item.isFav;
    if(favList.contains(item)){
      favList.remove(item);
    }else{
      favList.add(item);
    }
  }
}

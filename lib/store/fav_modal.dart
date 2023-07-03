import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/modal/album_modal.dart';

part 'fav_modal.g.dart';

class FavAlbums = _FavAlbums with _$FavAlbums;

abstract class _FavAlbums with Store{
  int albumIndex;
  Items items;

  _FavAlbums(this.albumIndex, this.items);
}
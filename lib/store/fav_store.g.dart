// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavStore on _FavStore, Store {
  Computed<int>? _$totalNoComputed;

  @override
  int get totalNo => (_$totalNoComputed ??=
          Computed<int>(() => super.totalNo, name: '_FavStore.totalNo'))
      .value;

  late final _$favListAtom = Atom(name: '_FavStore.favList', context: context);

  @override
  ObservableList<AllItems> get favList {
    _$favListAtom.reportRead();
    return super.favList;
  }

  @override
  set favList(ObservableList<AllItems> value) {
    _$favListAtom.reportWrite(value, super.favList, () {
      super.favList = value;
    });
  }

  late final _$_FavStoreActionController =
      ActionController(name: '_FavStore', context: context);

  @override
  void toggleFav(AllItems item) {
    final _$actionInfo =
        _$_FavStoreActionController.startAction(name: '_FavStore.toggleFav');
    try {
      return super.toggleFav(item);
    } finally {
      _$_FavStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favList: ${favList},
totalNo: ${totalNo}
    ''';
  }
}

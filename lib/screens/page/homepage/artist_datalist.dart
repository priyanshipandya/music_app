import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/modal/all_data.dart';

import '../../../main.dart';
import '../../../store/pagination_store.dart';
import '../../../values/app_styles.dart';
import '../../../values/colors.dart';
import '../../../values/strings.dart';
import '../../../values/urls.dart';

// ignore: must_be_immutable
class ArtistList extends StatelessWidget {
  ArtistList({super.key, required this.data1, this.artistId});

  final AllData? data1;
  final String? artistId;

  final ScrollController _scrollController = ScrollController();

  PaginationStore pagination = PaginationStore();

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!pagination.isLoading) {
        pagination.isLoading = true;

        _loadNextPage(artistId);

        pagination.isLoading = false;
      }
    }
  }

  Future<void> _loadNextPage(artistId) async {
    await pagination.fetchNextPage(artistId, fetchAPI.dio);
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      _onScroll();
    });
    _loadNextPage(artistId);
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColors.kWhite,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: CircleAvatar(
              radius: 0,
              backgroundColor: Colors.white.withOpacity(0.1),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                data1?.poster ?? Urls.defaultImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 150,
                sigmaY: 150,
              ),
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.only(top: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                              data1?.poster ?? Urls.defaultImage,
                              height: MediaQuery.of(context).size.width * 0.7,
                              width: MediaQuery.of(context).size.width * 0.7,
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: true,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pagination.isLoading == true
                              ? pagination.allArtistItems.length + 1
                              : pagination.allArtistItems.length,
                          itemBuilder: (context, index) {
                            if (index < pagination.allArtistItems.length) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 7),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.1),
                                          Colors.white.withOpacity(0.2),
                                        ],
                                        begin: AlignmentDirectional.topStart,
                                        end: AlignmentDirectional.bottomEnd,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          pagination
                                                                  .allArtistItems[
                                                                      index]
                                                                  .name ??
                                                              Strings
                                                                  .unknownRecord,
                                                          style: AppStyles
                                                              .mediumTextStyleLabel,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 9,
                                                                  top: 6),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .person_outline_outlined,
                                                                color: Colors
                                                                    .black87,
                                                                size: 20,
                                                                weight: 100,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List
                                                                    .generate(
                                                                  pagination
                                                                          .allArtistItems[
                                                                              index]
                                                                          .artists
                                                                          ?.length ??
                                                                      0,
                                                                  (i) =>
                                                                      SizedBox(
                                                                    width: 200,
                                                                    child: Text(
                                                                      "${pagination.allArtistItems[index].artists?[i].name}",
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.black87),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      // maxLines: 1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 9),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .audiotrack_outlined,
                                                                size: 20,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                              SizedBox(
                                                                width: 200,
                                                                child: Text(
                                                                  "${data1?.songCreater}",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black87),
                                                                  // style: AppStyles
                                                                  //     .smallTextStyle,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Icon getFavIcon(int index, AllItems item) {
    debugPrint(favStore.favList.toString());
    if (favStore.favList.contains(item)) {
      return const Icon(Icons.favorite);
    } else {
      return const Icon(Icons.favorite_border);
    }
  }
}

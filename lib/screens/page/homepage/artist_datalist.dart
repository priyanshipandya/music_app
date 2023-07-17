import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:provider_practical_7/screens/page/music.dart';
import '../../../api/api_service/pagination_store.dart';
import '../../../main.dart';
import '../../../values/app_styles.dart';
import '../../../values/strings.dart';
import '../../../values/urls.dart';

class ArtistList extends StatefulWidget {
  ArtistList({super.key, required this.data1, this.artistId});

  final AllData? data1;
  final String? artistId;

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  late ScrollController _scrollController;
  PaginationStore pagination = PaginationStore();

  @override
  void initState() {
    setState(() {
      _scrollController = ScrollController();
      _scrollController.addListener(_onScroll);
    });
    super.initState();
    _loadNextPage(widget.artistId);
  }

  bool _isLoading = false;

  void _onScroll() {
    print("Outside scroll");
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      if (!_isLoading) {
        _isLoading = true;
        _loadNextPage(widget.artistId);
      }

      print("reached at End");
    }
    // if (_scrollController.position.pixels ==
    //     _scrollController.position.maxScrollExtent) {
    //   _loadNextPage(widget.artistId);

    // }
  }

  Future<void> _loadNextPage(artistId) async {
    await pagination.fetchNextPage(artistId);
  }

  @override
  Widget build(BuildContext context) {
    // print("alitems length:  ${pagination.allArtistItems.length}");
    return SafeArea(
      child: Scaffold(
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
                widget.data1?.poster ?? Urls.defaultImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
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
                              widget.data1?.poster ?? Urls.defaultImage,
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
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          primary: false,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pagination.allArtistItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MusicPage(
                                        data: widget.data1, itemIndex: index),
                                  ),
                                );

                                // String? callme = data?.items[index].songUrl ??
                                //     "https://open.spotify.com/track/5nujrmhLynf4yMoMtj8AQF";
                                // try{
                                //   // if(await canLaunchUrl(Uri.parse(callme))){
                                //     await launchUrl(Uri.parse(callme));
                                //   // }else{
                                //   //   log("Can't launch", name: "CANT LAUNCH");
                                //   // }
                                // }catch(e){
                                //   log("error in launching $e", name: "ERROR IN LAUNCH");
                                // }
                              },
                              child: Padding(
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
                                                                  "${widget.data1?.songCreater}" ??
                                                                      "No data",
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
                                                    const Spacer(),
                                                    // IconButton(
                                                    //   icon: getFavIcon(index,
                                                    //       data1!.items[index]),
                                                    //   onPressed: () {
                                                    //     favStore.toggleFav(
                                                    //         data1!.items[index]);
                                                    //   },
                                                    // ),
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
                              ),
                            );
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
    print(favStore.favList);
    if (favStore.favList.contains(item)) {
      return const Icon(Icons.favorite);
    } else {
      return const Icon(Icons.favorite_border);
    }
  }
}

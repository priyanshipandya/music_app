import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/store/fav_store.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../values/app_styles.dart';
import '../../../values/colors.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    FavStore favStore = FavStore();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.height * 0.6,
                    decoration: AppStyles.emptyBoxDecor,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                              "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg",
                              height: MediaQuery.of(context).size.height * 0.6,
                              fit: BoxFit.fill),
                        ),
                        Positioned(
                          left: 5,
                          top: 5,
                          child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios_outlined),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12),
                  //   child: SizedBox(
                  //     width: 180,
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           snapshot.data?.albums?[index].name
                  //               .toString() ??
                  //               "Unknown",
                  //           style: AppStyles.boldMediumTextStyle,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12),
                  //   child: SizedBox(
                  //     width: 180,
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //             snapshot.data?.albums?[index].label ??
                  //                 "Unknown Created",
                  //             style: AppStyles.smallTextStyle),
                  //         // const Spacer(),
                  //         // Row(
                  //         //   mainAxisAlignment:
                  //         //   MainAxisAlignment.end,
                  //         //   children: [
                  //         //     const Icon(Icons.person_outline_outlined,
                  //         //         size: 12,
                  //         //         color: KColors.kOrange),
                  //         //     Text(
                  //         //       snapshot.data?.albums?[index].label ?? "Unknown Created",
                  //         //       style: AppStyles.smallTextStyle,
                  //         //     ),
                  //         //   ],
                  //         // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            favStore.favList.isEmpty
                ? const Center(
                    child: Text(
                      "No Favorites",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: favStore.favList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        // onTap: () async {
                        //   print(
                        //       "${favStore.favList[index].items.externalUrls?.spotify}");
                        //   String? callme = favStore
                        //           .favList[index].items.externalUrls?.spotify ??
                        //       "https://open.spotify.com/track/5nujrmhLynf4yMoMtj8AQF";
                        //   await launchUrl(Uri.parse(callme));
                        // },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                // Container(
                                //   height: 70,
                                //   width: 70,
                                //   decoration: BoxDecoration(
                                //     color: KColors.kGrey,
                                //     borderRadius: BorderRadius.circular(20),
                                //   ),
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(20),
                                //     child: Image.network(
                                //         data.images?[1].url ??
                                //             'https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg',
                                //         fit: BoxFit.cover),
                                //   ),
                                // ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Row(
                                          children: [
                                            // Text(
                                            //   favStore.favList[index].items.name ??
                                            //       "Unknown",
                                            //   style:
                                            //       AppStyles.boldMediumTextStyle,
                                            //   // overflow: TextOverflow.ellipsis,
                                            // ),
                                            // Text(
                                            //   Strings.twoSixtySevenThousand,
                                            //   style:
                                            //       AppStyles.mediumTextStyle,
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 9,
                                                    top: 6,
                                                    bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .person_outline_outlined,
                                                      color: KColors.kGrey,
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
                                                      children: List.generate(favStore.favList.length, (i) => Text("Hello")
                                                        //   "${favStore.favList.values[i].toList().}" ??
                                                        //       "Unknown Created",
                                                        //   style: AppStyles
                                                        //       .smallTextStyle,
                                                        //   overflow: TextOverflow
                                                        //       .ellipsis,
                                                        //   // maxLines: 1,
                                                        // ),)
                                                        // favStore.favList.values[index].
                                                        //         .favList[index].items
                                                        //         .artists
                                                        //         ?.length ??
                                                        //     0,
                                                        // (i) => Text(
                                                        //   "${favStore.favList[index]?.items.artists?[i].name}" ??
                                                        //       "Unknown Created",
                                                        //   style: AppStyles
                                                        //       .smallTextStyle,
                                                        //   overflow: TextOverflow
                                                        //       .ellipsis,
                                                        //   // maxLines: 1,
                                                        // ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.audiotrack_outlined,
                                                    size: 20,
                                                    color: KColors.kGrey,
                                                  ),
                                                  // Text(
                                                  //   "type: ${favStore.favList[index].items.type}" ??
                                                  //       "No data",
                                                  //   style: AppStyles
                                                  //       .smallTextStyle,
                                                  // ),
                                                  // const Spacer(),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Observer(
                                            builder: (context) {
                                              // log(favStore.favList.toString(), name: "FAVSTORE LIST" );
                                              print(
                                                  favStore.favList.toString());
                                              return Text("Heart");
                                              // return IconButton(
                                              //   icon: Icon(
                                              //       favStore.favList.contains(
                                              //               favStore
                                              //                   .favList[index])
                                              //           ? Icons.favorite
                                              //           : Icons.favorite_border,
                                              //       size: 30),
                                              //   onPressed: () {
                                              //     // favStore.toggleFav(data., items)
                                              //   },
                                              // );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Spacer(),
                                // IconButton(icon: Icon(Icons.favorite_border, size: 30), onPressed: () {}, ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String? spotifyUrl) async {
    print("Url: $spotifyUrl");
    if (await canLaunchUrl(Uri.parse(spotifyUrl!))) {
      await launchUrl(spotifyUrl as Uri);
    } else {
      throw "Could not launch Url";
    }
  }
}

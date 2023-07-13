import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../values/app_styles.dart';
import '../../../values/colors.dart';
import '../../main.dart';
import '../../modal/all_data.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Observer(
          builder: (context) => Column(
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
                        padding: EdgeInsets.zero,
                        primary: false,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: favStore.favList.length,
                        itemBuilder: (context, index) {
                          log(favStore.favList.length.toString(),
                              name: "LENGTH OF FAVLIST");
                          return GestureDetector(
                            // onTap: () async {
                            //   print(
                            //       "${favStore.favList[index].items.externalUrls?.spotify}");
                            //   String? callme = favStore
                            //           .favList[index].items.externalUrls?.spotify ??
                            //       "https://open.spotify.com/track/5nujrmhLynf4yMoMtj8AQF";
                            //   await launchUrl(Uri.parse(callme));
                            // },
                            child: Observer(
                              builder: (context) => Card(
                                margin:
                                const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 12),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${favStore.favList[index].songName.toString()}",
                                                    style: AppStyles.boldMediumTextStyle,
                                                    // overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 9, top: 6),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          const Icon(
                                                            Icons.person_outline_outlined,
                                                            color: KColors.kGrey,
                                                            size: 20,
                                                            weight: 100,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: List.generate(
                                                              1 ??
                                                                  0,
                                                                  (i) => SizedBox(
                                                                width: 200,
                                                                child: Text(
                                                                  "${favStore.favList[index].artists?[i].name}",
                                                                  style: AppStyles
                                                                      .smallTextStyle,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
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
                                                      EdgeInsets.only(left: 9),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          const Icon(
                                                            Icons.audiotrack_outlined,
                                                            size: 20,
                                                            color: KColors.kGrey,
                                                          ),
                                                          SizedBox(
                                                            width: 200,
                                                            child: Text(
                                                              "${"favStore.favList[index]."}" ??
                                                                  "No data",
                                                              style: AppStyles
                                                                  .smallTextStyle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Observer(
                                                  builder: (context) {
                                                    return IconButton(
                                                      icon: getFavIcon(
                                                          index, favStore.favList[index]),
                                                      onPressed: () {
                                                        favStore
                                                            .toggleFav(favStore.favList[index]);
                                                      },
                                                    );
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
                              )
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  //
  // Icon getFavIcon(int index, AllItems item) {
  //   print(favStore.favList);
  //   if (favStore.favList.contains(item)) {
  //     return const Icon(Icons.favorite);
  //   } else {
  //     return const Icon(Icons.favorite_border);
  //   }
  // }

  Icon getFavIcon(int index, AllItems item) {
    print(favStore.favList);
    if (favStore.favList.contains(item)) {
      return const Icon(Icons.favorite);
    } else {
      return const Icon(Icons.favorite_border);
    }
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

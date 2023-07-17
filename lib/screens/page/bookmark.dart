import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../values/app_styles.dart';
import '../../main.dart';
import '../../modal/all_data.dart';
import '../../values/strings.dart';
import '../../values/urls.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                            Urls.defaultImage,
                            height: MediaQuery.of(context).size.width * 0.7,
                            width: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
                favStore.favList.isEmpty
                    ? const Center(
                        child: Text(
                          Strings.noFav,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 7),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 8),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.7),
                                            Colors.white.withOpacity(0.5),
                                          ],
                                          begin: AlignmentDirectional.topStart,
                                          end: AlignmentDirectional.bottomEnd,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 6),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            favStore
                                                                .favList[index]
                                                                .songName
                                                                .toString(),
                                                            style: AppStyles
                                                                .mediumTextStyleLabel,
                                                            // overflow: TextOverflow.ellipsis,
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
                                                                        .black,
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
                                                                      1,
                                                                      (i) =>
                                                                          SizedBox(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            Text(
                                                                          "${favStore.favList[index].artists?[i].name}",
                                                                          style:
                                                                              AppStyles.smallTextStyle,
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
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 9),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .audiotrack_outlined,
                                                                      size: 20,
                                                                      color: Colors
                                                                          .black),
                                                                  SizedBox(
                                                                    width: 200,
                                                                    child: Text(
                                                                      "Albums",
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
                                                                  index,
                                                                  favStore.favList[
                                                                      index]),
                                                              onPressed: () {
                                                                favStore.toggleFav(
                                                                    favStore.favList[
                                                                        index]);
                                                              },
                                                            );
                                                          },
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
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
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
    debugPrint(favStore.favList.toString());
    if (favStore.favList.contains(item)) {
      return const Icon(Icons.favorite);
    } else {
      return const Icon(Icons.favorite_border);
    }
  }

  void _launchUrl(String? spotifyUrl) async {
    if (await canLaunchUrl(Uri.parse(spotifyUrl!))) {
      await launchUrl(spotifyUrl as Uri);
    } else {
      throw Strings.throwUrlError;
    }
  }
}

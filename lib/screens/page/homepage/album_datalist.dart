import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:provider_practical_7/screens/page/music.dart';
import '../../../main.dart';
import '../../../values/app_styles.dart';
import '../../../values/colors.dart';

class AlbumList extends StatelessWidget {
  AlbumList({super.key, required this.data});

  final AllData? data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                data?.poster ??
                    "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 150,
                sigmaY: 150,
              ),
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.only(top: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                  data?.poster ??
                                      "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg",
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  fit: BoxFit.fill),
                            ),
                            Positioned(
                              left: 5,
                              top: 5,
                              child: IconButton(
                                  icon:
                                      const Icon(Icons.arrow_back_ios_outlined),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data?.items.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () async {
                          print("time: ${data?.items[index].songDurationInMs}");
                          print("other: ${data?.items[index].songUrl}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MusicPage(data: data, itemIndex: index),
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
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
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
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Text(
                                                  data?.items?[index]
                                                          .songName ??
                                                      "Unknown",
                                                  style: AppStyles
                                                      .boldMediumTextStyle,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 9, top: 6),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .person_outline_outlined,
                                                          color: Colors.black87,
                                                          // color: KColors.darkBlack,
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
                                                          children:
                                                              List.generate(
                                                            data
                                                                    ?.items[
                                                                        index]
                                                                    .artists
                                                                    ?.length ??
                                                                0,
                                                            (i) => SizedBox(
                                                              width: 200,
                                                              child: Text(
                                                                "${data?.items[index].artists?[i].name}",
                                                                style: const TextStyle(
                                                                    color: Colors.black87
                                                                ),
                                                                // style: AppStyles
                                                                //     .smallTextStyle,
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
                                                    padding: const EdgeInsets.only(
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
                                                          color: Colors.black87,
                                                        ),
                                                        SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                            "${data?.songCreater}" ??
                                                                "No data",
                                                            style: const TextStyle(color: Colors.black87),
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
                                              Observer(
                                                builder: (context) {
                                                  return IconButton(
                                                    icon: getFavIcon(index,
                                                        data!.items[index]),
                                                    onPressed: () {
                                                      favStore.toggleFav(
                                                          data!.items[index]);
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
                            ),
                          ),
                        ),
                      ),
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

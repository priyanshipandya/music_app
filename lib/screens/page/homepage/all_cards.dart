import 'package:flutter/material.dart';
import 'package:provider_practical_7/api/api_service/pagination_store.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:provider_practical_7/screens/page/homepage/artist_datalist.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../values/app_styles.dart';
import 'album_datalist.dart';

class HomePageCards extends StatelessWidget {
  HomePageCards({super.key, required this.allData, required this.cardNo});

  final List<AllData> allData;
  final int cardNo;


  @override
  Widget build(BuildContext context) {
    final List<AllData> allAlbumData =
        allData.where((element) => element.cardNo == cardNo).toList();
    print("From allData build: ${allAlbumData.length}");
    return SizedBox(
      height: 250,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: allAlbumData.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () async {
                if (cardNo == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlbumList(data: allAlbumData[i]),
                    ),
                  );
                } else if (cardNo == 2) {
                  String? artistId = allAlbumData[i].id;
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtistList(data1: allAlbumData[i], artistId: artistId),
                      ),
                    );
                  }
                } else {
                  await launchUrl(Uri.parse(allAlbumData[i].items[i].songUrl));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    fit: StackFit.loose,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: 200,
                        decoration: AppStyles.emptyBoxDecor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                              allAlbumData[i].poster ??
                                  "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                        // left: 30,
                        bottom: 5,
                        child: SizedBox(
                          width: 180,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                allAlbumData[i].albumLabelName ?? "Unknown",
                                style: AppStyles.boldMediumTextStyle,
                              ),
                            ],
                          ),
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
                      //           allAlbumData[i].albumLabelName ?? "Unknown",
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
                      //             allAlbumData[i].songCreater ??
                      //                 "Unknown Created",
                      //             style: AppStyles.smallTextStyle),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

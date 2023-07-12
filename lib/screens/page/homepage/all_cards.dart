import 'package:flutter/material.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../api/api_service/fetch_data.dart';
import '../../../values/app_styles.dart';
import 'album_datalist.dart';

class HomePageCards extends StatelessWidget {
  HomePageCards({super.key, required this.allData, required this.cardNo});

  final List<AllData> allData;
  final int cardNo;

  // FetchAPIDatas fetchAlbumAPI = FetchAPIDatas();

  @override
  Widget build(BuildContext context) {
    final List<AllData> allAlbumData =
        allData.where((element) => element.cardNo == cardNo).toList();
    return SizedBox(
      height: 270,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: allAlbumData.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () async {
                if (cardNo != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlbumList(data: allAlbumData[i]),
                    ),
                  );
                } else {
                  await launchUrl(Uri.parse(allAlbumData[i].items[i].songUrl));
                }
              },
              child: Card(
                // color: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 180,
                        width: 180,
                        decoration: AppStyles.emptyBoxDecor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                              allAlbumData[i].poster ??
                                  "https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          width: 180,
                          child: Row(
                            children: [
                              Text(
                                  allAlbumData[i].songCreater ??
                                      "Unknown Created",
                                  style: AppStyles.smallTextStyle),
                              // const Spacer(),
                              // Row(
                              //   mainAxisAlignment:
                              //   MainAxisAlignment.end,
                              //   children: [
                              //     const Icon(Icons.person_outline_outlined,
                              //         size: 12,
                              //         color: KColors.kOrange),
                              //     Text(
                              //       snapshot.data?.albums?[index].label ?? "Unknown Created",
                              //       style: AppStyles.smallTextStyle,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

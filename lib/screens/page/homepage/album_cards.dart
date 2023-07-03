import 'package:flutter/material.dart';
import 'package:provider_practical_7/modal/album_modal.dart';
import '../../../values/app_styles.dart';
import '../../../values/colors.dart';
import 'album_datalist.dart';

class AlbumCards extends StatelessWidget {
  const AlbumCards({super.key, required this.fetchApi});

  final Future<SpotifyAlbum> fetchApi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: FutureBuilder(
        future: fetchApi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.albums?.length ?? 0,
              padding: const EdgeInsets.only(left: 18),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(snapshot.data?.albums?[index].tracks?.items?[0].externalUrls?.spotify);
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AlbumList(data: snapshot.data!.albums![index]),
                    ),
                  );
                  },
                  child: Card(
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
                                  snapshot.data?.albums?[index].images?[1].url
                                          .toString() ??
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
                                    snapshot.data?.albums?[index].name
                                            .toString() ??
                                        "Unknown",
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
                                      snapshot.data?.albums?[index].label ??
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
              },
            );
          } else if (snapshot.hasError) {
            return const Text("Regenerate Token:) This one is expired!!");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

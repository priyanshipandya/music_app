import 'package:flutter/material.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:provider_practical_7/screens/page/homepage/artist_datalist.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../values/app_styles.dart';
import '../../../values/strings.dart';
import 'album_datalist.dart';

class HomePageCards extends StatelessWidget {
  const HomePageCards({super.key, required this.allData, required this.cardNo});

  final List<AllData> allData;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    final List<AllData> allAlbumData =
        allData.where((element) => element.cardNo == cardNo).toList();
    return SizedBox(
      height: 230,
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
                      builder: (context) => ArtistList(
                          data1: allAlbumData[i], artistId: artistId),
                    ),
                  );
                }
              } else {
                try {
                  for (int idx = 0; idx < 3; idx++) {
                    if (await canLaunchUrl(
                        Uri.parse(allAlbumData[i].items[idx].songUrl))) {
                      await launchUrl(
                          Uri.parse(allAlbumData[i].items[idx].songUrl));
                    }
                  }
                } on Error catch(e){
                  print("===============$e===================");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(Strings.downloadSpotify),
                    ),
                  );
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // alignment: Alignment.topCenter,
                  // fit: StackFit.loose,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 185,
                      width: 175,
                      decoration: AppStyles.emptyBoxDecor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(allAlbumData[i].poster,
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      allAlbumData[i].albumLabelName ?? Strings.unknownRecord,
                      style: AppStyles.boldMediumTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

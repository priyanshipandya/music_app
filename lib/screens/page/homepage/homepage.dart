import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_practical_7/api/api_service/fetch_data.dart';
import 'package:provider_practical_7/modal/music_modal.dart';
import 'package:provider_practical_7/screens/page/homepage/track_cards.dart';
import 'package:provider_practical_7/values/app_styles.dart';
import '../../../modal/album_modal.dart';
import '../../../values/colors.dart';
import '../../../values/strings.dart';
import 'album_cards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}


// final client = FetchMusic(
//   Dio(
//     BaseOptions(headers: {
//       'Authorization': 'Bearer BQCY8Ryn-3tM_FWuFBXrITiwZrSR6Ch9nERFcEfXreYZiWFKiySf41Uz_eyvfqm8vINtb4oMdNFL5gF7ry9rJFsL43LUjTalTNDGHDiPRRerVD4qeIY',
//     }),
//   )..interceptors.add(LogInterceptor()),
// );

class _DashboardState extends State<Dashboard> {
  List names = ['All', 'Playlists', 'Songs', 'Podcasts & Shows', 'Artist', 'Album', 'Profile'];
  List btnColors = List.filled(7, false);
  final searchController = TextEditingController();
  late Future<SpotifyModal> fetchTracks;
  late Future<SpotifyAlbum> fetchAlbums;
  // late Future<SpotifyModal> fetchMusic;

  @override
  void initState() {
    fetchTracks = fetchMusicTrack("https://api.spotify.com/v1/tracks?ids=7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B");
    // fetchTracks = fetchMusicApi<SpotifyModal>("https://api.spotify.com/v1/playlists?ids=1MuDVTTNqRmEUV1dzyfMnB,3AAeD7XiPsK3UtmXyPCvfz,7HEVGWzjOGo2DacxG0ESFg", (json) => SpotifyModal.fromJson(json));
    fetchAlbums = fetchMusicAlbum("https://api.spotify.com/v1/albums?ids=5gQZvWM1o8NkQndueJtZcP,2VP96XdMOKTXefI8Nui23s,5fy0X0JmZRZnVa2UEicIOl,1xn54DMo2qIqBuMqHtUsFd,3Lp4JKk2ZgNkybMRS3eZR5,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc");
    // fetchTracks = fetchMusicApi<SpotifyModal>("https://api.spotify.com/v1/tracks?ids=7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B", (json) => SpotifyModal.fromJson(json));
    // // fetchTracks = fetchMusicApi<SpotifyModal>("https://api.spotify.com/v1/playlists?ids=1MuDVTTNqRmEUV1dzyfMnB,3AAeD7XiPsK3UtmXyPCvfz,7HEVGWzjOGo2DacxG0ESFg", (json) => SpotifyModal.fromJson(json));
    // fetchAlbums = fetchMusicApi<SpotifyAlbum>("https://api.spotify.com/v1/albums?ids=5gQZvWM1o8NkQndueJtZcP,1xn54DMo2qIqBuMqHtUsFd,2VP96XdMOKTXefI8Nui23s,5fy0X0JmZRZnVa2UEicIOl,1xn54DMo2qIqBuMqHtUsFd,3Lp4JKk2ZgNkybMRS3eZR5,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc", (json) => SpotifyAlbum.fromJson(json));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.hello,
                          style: AppStyles.helloTextStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          Strings.username,
                          style: AppStyles.userNameTextStyle,
                        ),
                      ],
                    ),

                    Container(
                      height: 44,
                      width: 44,
                      decoration: AppStyles.imageBoxDecor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          Strings.staticImagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 40,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: names.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      log("${names.length}", name: "LENGTH");
                      btnColors[index] = !btnColors[index];
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      width: 104,
                      decoration: BoxDecoration(
                        color: btnColors[index] ? KColors.kBlue : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "${names[index]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                btnColors[index] ? Colors.white : KColors.kBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 5,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, bottom: 10, left: 20),
                child: Row(
                  children: [
                    const Text(
                      Strings.allTracks,
                      style: AppStyles.titleTextStyle,
                    ),
                    // const Spacer(),
                    // GestureDetector(
                    //   behavior: HitTestBehavior.opaque,
                    //   child: const Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         Strings.seeAll,
                    //         style: AppStyles.seeAllTextStyle,
                    //       ),
                    //       Icon(
                    //         Icons.arrow_forward_ios_outlined,
                    //         size: 12,
                    //         color: KColors.kSeeAllColor,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              TrackCards(fetchApi: fetchTracks),
              const Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 10, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Albums",
                    style: AppStyles.titleTextStyle,
                  ),
                ),
              ),
              AlbumCards(fetchApi: fetchAlbums),
            ],
          ),
        ),
      ),
    );
  }
}

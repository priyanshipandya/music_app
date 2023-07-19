import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider_practical_7/modal/all_data.dart';
import 'package:provider_practical_7/screens/page/homepage/shimmer_home_page.dart';
import 'package:provider_practical_7/values/app_styles.dart';
import '../../../main.dart';
import '../../../values/colors.dart';
import '../../../values/strings.dart';
import '../../../values/urls.dart';
import 'all_cards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List names = [
    'All',
    'Playlists',
    'Songs',
    'Podcasts & Shows',
    'Artist',
    'Album',
    'Profile'
  ];
  List btnColors = List.filled(7, false);
  final searchController = TextEditingController();
  late Future<List<AllData>> fetchTracks;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Observer(
          builder: (context) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            Strings.username,
                            style: AppStyles.userNameTextStyle,
                          ),
                        ],
                      ),
                      Image.asset(
                        Urls.notification,
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: names.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        btnColors[index] = !btnColors[index];
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 104,
                        decoration: BoxDecoration(
                            color: btnColors[index]
                                ? KColors.darkBlack
                                : KColors.kLightBlack,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: btnColors[index]
                                    ? KColors.kWhite
                                    : KColors.kLightBlack)),
                        child: Center(
                          child: Text(
                            "${names[index]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: btnColors[index]
                                  ? KColors.kWhite
                                  : KColors.kTextGrey,
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
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 0, left: 20),
                  child: Row(
                    children: [
                      Text(
                        Strings.allTracks,
                        style: AppStyles.titleTextStyle,
                      ),
                    ],
                  ),
                ),
                fetchAPI.callTrackAPI?.status == FutureStatus.pending
                    ? const ShimmerHomePageCards()
                    : HomePageCards(allData: allData, cardNo: 0),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 0, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Strings.allAlbums,
                      style: AppStyles.titleTextStyle,
                    ),
                  ),
                ),
                fetchAPI.callAbumAPI?.status == FutureStatus.pending
                    ? const ShimmerHomePageCards()
                    : HomePageCards(allData: allData, cardNo: 1),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 0, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Strings.allArtist,
                      style: AppStyles.titleTextStyle,
                    ),
                  ),
                ),
                fetchAPI.callArtistAPI?.status == FutureStatus.pending
                    ? const ShimmerHomePageCards()
                    : HomePageCards(allData: allData, cardNo: 2),
                // AlbumCards(fetchApi: fetchAlbums),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/values/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../modal/all_data.dart';
import '../../modal/search.dart';
import '../../store/search_store.dart';
import '../../values/app_styles.dart';
import '../../values/colors.dart';
import '../../values/urls.dart';
import 'music.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  final searchApi = SearchApi();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: searchController,
                    cursorColor: KColors.kLightWhite,
                    style: AppStyles.searchStyle,
                    decoration: const InputDecoration(
                      prefixIcon: AppStyles.prefixIconStyle,
                      hintText: Strings.search,
                      hintStyle: AppStyles.searchHintStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: KColors.kLightBlack,
                    ),
                    onChanged: (value) async {
                      final query = value;
                      await searchApi.searchAlbums(query);
                    },
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KColors.kLightBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 20.0),
                  ),
                  child: Image.asset(
                    Urls.filter,
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: searchController.text.isEmpty
            ? const Center(
                child: Text(
                  Strings.noData,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchApi.searchResults.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    color: KColors.kProfileBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          String uri = searchApi.searchResults[i].uri ?? "";
                          if (await canLaunchUrl(Uri.parse(uri))) {
                            await launchUrl(Uri.parse(uri));
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(Strings.downloadSpotify),
                                ),
                              );
                            }
                          }
                        } on Error {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Download Spotify"),
                            ),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: KColors.kGrey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                searchApi.searchResults[i].images?[1].url ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              searchApi.searchResults[i].name ?? "",
                              style: AppStyles.smallTextStyleWhiteLabel,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_practical_7/values/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../modal/all_data.dart';
import '../../values/app_styles.dart';
import '../../values/colors.dart';
import '../../values/urls.dart';
import 'music.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  List<AllData> filteredData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onChanged: (value) {
                    filteredData.clear();
                    for (var data in allData) {
                      List<AllItems> filteredItems = data.items.where((item) {
                        return item.songName.toLowerCase().contains(
                            searchController.text.toLowerCase().trim());
                      }).toList();

                      if (filteredItems.isNotEmpty) {
                        bool alreadyExists = filteredData.any(
                            (d) => d.albumLabelName == data.albumLabelName);
                        if (!alreadyExists) {
                          filteredData.add(AllData(
                              1,
                              filteredItems,
                              data.poster,
                              data.songCreater,
                              data.albumLabelName,
                              null));
                        }
                      }
                    }
                    setState(() {});
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
      body: filteredData.isEmpty || searchController.text.isEmpty
          ? const Center(
              child: Text(
                Strings.noData,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemCount: filteredData.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemBuilder: (context, index) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredData[index].items.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      color: KColors.kProfileBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          try {
                            String uri = filteredData[index].items[i].songUrl;
                            if (await canLaunchUrl(Uri.parse(uri))) {
                              await launchUrl(Uri.parse(uri));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Download Spotify"),
                                ),
                              );
                            }
                          } on Error {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please Download Spotify"),
                              ),
                            );
                          }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MusicPage(
                          //         data: filteredData[index], itemIndex: index),
                          //   ),
                          // );
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
                                  filteredData[index].poster,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              filteredData[index].items[i].songName,
                              style: AppStyles.smallTextStyleWhiteLabel,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

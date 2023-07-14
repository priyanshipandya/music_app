import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider_practical_7/values/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../modal/all_data.dart';
import '../../values/app_styles.dart';
import '../../values/colors.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  List<AllData> filteredData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                        color: KColors.kGrey,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: searchController,
                    cursorColor: KColors.kBlue,
                    decoration: const InputDecoration(
                      prefixIcon: AppStyles.prefixIconStyle,
                      hintText: Strings.search,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              ElevatedButton(
                onPressed: () {
                  filteredData.clear();
                  for (var data in allData) {
                    List<AllItems> filteredItems = data.items.where((item) {
                      return item.songName
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase().trim());
                    }).toList();

                    if (filteredItems.isNotEmpty) {
                      bool alreadyExists = filteredData
                          .any((d) => d.albumLabelName == data.albumLabelName);
                      if (!alreadyExists) {
                        filteredData.add(AllData(1, filteredItems, data.poster,
                            data.songCreater, data.albumLabelName));
                      }
                    }
                  }
                  // for (int i = 0; i < allData.length; i++) {
                  //   for (int item = 0; item < allData[i].items.length; item++) {
                  //     if (allData[i]
                  //         .items[item]
                  //         .songName
                  //         .toLowerCase()
                  //         .trim()
                  //         .contains(
                  //             searchController.text.toLowerCase().trim())) {
                  //       filteredData.add(AllData(allData[i].items[item]., poster));
                  //     }
                  //   }
                  // }
                  setState(() {});
                  log(filteredData.length.toString(), name: "MUSIC NAMEEEEE");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.kBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 25.0),
                ),
                child: const Text(
                  Strings.filter,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: filteredData.isEmpty
          ? const Center(
              child: Text(Strings.noData, style: TextStyle(color: Colors.white, fontSize: 18),),
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
                            vertical: 2, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  String uri =
                                      filteredData[index].items[i].songUrl;
                                  await launchUrl(Uri.parse(uri));
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: KColors.kGrey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                            filteredData[index].poster ??
                                                'https://jonlieffmd.com/wp-content/uploads/2013/02/Music-vector-Feature-HiRes1-scaled.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${filteredData[index].items[i].songName}",
                                      style: AppStyles.mediumTextStyleLabel,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
    );
  }
}

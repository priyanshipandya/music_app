import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/values/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../store/search_store.dart';
import '../../values/app_styles.dart';
import '../../values/colors.dart';
import '../../values/urls.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  final searchStore = SearchStore();

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
                child: Observer(
                  builder: (context) => TextField(
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
                      final query = searchController.text;
                      await searchStore.searchAlbums(query);
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              ElevatedButton(
                onPressed: () {
                  print(searchStore.searchResults[0].images?[1].url);
                },
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
          : ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        shrinkWrap: true,
        itemCount: searchStore.searchResults.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        itemBuilder: (context, index) {
          return Observer(
            builder: (context) => Card(
              margin:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              color: KColors.kProfileBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () async {
                  try {
                    String uri =
                        searchStore.searchResults[index].uri ?? "";
                    if (await canLaunchUrl(Uri.parse(uri))) {
                      await launchUrl(Uri.parse(uri));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(Strings.downloadSpotify),
                        ),
                      );
                    }
                  } on Error {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(Strings.downloadSpotify),
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
                          searchStore
                              .searchResults[index].images?[1].url ??
                              "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Observer(
                        builder: (context) => Text(
                          searchStore.searchResults[index].name ?? "",
                          style: AppStyles.smallTextStyleWhiteLabel,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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

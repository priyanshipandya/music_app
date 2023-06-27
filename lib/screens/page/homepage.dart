import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practical_7/api/api_service/fetch_data.dart';
import 'package:provider_practical_7/values/app_styles.dart';
import '../../modal/image_modal.dart';
import '../../values/colors.dart';
import '../../values/strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List names = ['Office', 'Factory', 'Building'];
  List btnColors = List.filled(3, false);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => APIServiceUsingProvider().fetchData(),
      initialData: null,
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: SingleChildScrollView(
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
                          //hello label
                          Text(
                            Strings.hello,
                            style: AppStyles.helloTextStyle,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          //user name label
                          Text(
                            Strings.username,
                            style: AppStyles.userNameTextStyle,
                          ),
                        ],
                      ),
                      //image container
                      Container(
                        height: 44,
                        width: 44,
                        decoration: AppStyles.imageBoxDecor,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              Strings.staticImagePath,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
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
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            controller: searchController,
                            cursorColor: KColors.kBlue,
                            decoration: const InputDecoration(
                              prefixIcon: AppStyles.prefixIconStyle,
                              hintText: Strings.search,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
                //categories container
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
                          color:
                              btnColors[index] ? KColors.kBlue : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${names[index]}",
                            style: TextStyle(
                              color: btnColors[index]
                                  ? Colors.white
                                  : KColors.kGrey,
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
                //all property label
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20),
                  child: Row(
                    children: [
                      const Text(
                        Strings.allProperty,
                        style: AppStyles.titleTextStyle,
                      ),
                      const Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Strings.seeAll,
                              style: AppStyles.seeAllTextStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                              color: KColors.kSeeAllColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //all properties list
                SizedBox(
                  height: 270,
                  child: Consumer<ImageDataFromPexel?>(
                    builder: (context, value, child) => (value
                                ?.photos?.isEmpty ??
                            true)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: value?.photos?.length,
                            padding: const EdgeInsets.only(left: 18),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Card(
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
                                          (value?.photos?[index].src?.medium ??
                                              Strings.error403),
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(child: Text("$error")),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: SizedBox(
                                        width: 180,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              Strings.threeStoryOffice,
                                              style:
                                                  AppStyles.boldMediumTextStyle,
                                            ),
                                            Spacer(),
                                            Text(
                                              Strings.twoSixtySevenThousand,
                                              style: AppStyles.mediumTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: SizedBox(
                                        width: 180,
                                        child: Row(
                                          children: [
                                            Text(Strings.twoThousand,
                                                style:
                                                    AppStyles.smallTextStyle),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                    Icons
                                                        .person_outline_outlined,
                                                    size: 12,
                                                    color: KColors.kOrange),
                                                Text(
                                                  Strings.twentyFive,
                                                  style:
                                                      AppStyles.smallTextStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                //featured property label
                const Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 10, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Strings.featuredProperty,
                      style: AppStyles.titleTextStyle,
                    ),
                  ),
                ),
                //featured property list
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Consumer<ImageDataFromPexel?>(
                    builder: (context, value, child) => (value
                                ?.photos!.isEmpty ??
                            true)
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            primary: false,
                            physics: const BouncingScrollPhysics(),
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) => Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    //image section
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: KColors.kGrey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                            "${value?.photos?[index].src?.medium}",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const Flexible(
                                      child: Column(
                                        children: [
                                          //price and title
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Text(
                                                  Strings.twoStoryOffice,
                                                  style: AppStyles
                                                      .boldMediumTextStyle,
                                                ),
                                                Spacer(),
                                                Text(
                                                  Strings.twoSixtySevenThousand,
                                                  style:
                                                      AppStyles.mediumTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 9, top: 6, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: KColors.kGrey,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  Strings.newYorkCity,
                                                  style:
                                                      AppStyles.smallTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                          //area section
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Text(
                                                  Strings.twoThousand,
                                                  style:
                                                      AppStyles.smallTextStyle,
                                                ),
                                                Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .person_outline_outlined,
                                                      size: 14,
                                                      color: KColors.kOrange,
                                                    ),
                                                    Text(Strings.twentyFive,
                                                        style: AppStyles
                                                            .smallTextStyle),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_practical_7/screens/page/profile.dart';
import 'package:provider_practical_7/store/navigation_store.dart';
import '../../values/urls.dart';
import 'bookmark.dart';
import 'fab.dart';
import 'homepage/homepage.dart';
import 'search.dart';

class DashboardMainScreen extends StatelessWidget {
  DashboardMainScreen({Key? key}) : super(key: key);

  final screens = [
    const Dashboard(),
    const BookmarkPage(),
    const FABPage(),
    const SearchPage(),
    ProfilePage(),
  ];

  final navigationStore = NavigationStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        // extendBody: true,
        body: IndexedStack(
            index: navigationStore.currentIndex, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  Urls.homeIcon,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Urls.bookmarkIcon,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Urls.videoIcon,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Urls.searchIcon,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  Urls.userIcon,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
                label: ""),
          ],
          onTap: (index) {
            navigationStore.changeIndex(index);
          },
          currentIndex: navigationStore.currentIndex,
        ),
      ),
    );
  }
}

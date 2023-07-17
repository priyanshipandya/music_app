import 'package:flutter/material.dart';
import 'package:provider_practical_7/screens/page/profile.dart';
import '../../values/colors.dart';
import '../../values/urls.dart';
import 'bookmark.dart';
import 'fab.dart';
import 'homepage/homepage.dart';
import 'search.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({Key? key}) : super(key: key);

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  int _selectedIndex = 0;
  final screens = [
    const Dashboard(),
    const BookmarkPage(),
    const FABPage(),
    SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: screens),
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
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }

  GestureDetector buildGestureDetector(int idx, IconData icons) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _selectedIndex = idx;
        });
      },
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: _selectedIndex == idx ? KColors.kBlue.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icons,
          color: KColors.kBlue,
          size: 30,
        ),
      ),
    );
  }
}

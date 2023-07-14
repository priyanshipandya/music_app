import 'package:flutter/material.dart';
import 'package:provider_practical_7/screens/page/profile.dart';
import 'package:provider_practical_7/values/app_styles.dart';
import '../../values/colors.dart';
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
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.white), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border, color: Colors.white),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "asset/images/reels.png",
                height: 25,
                width: 25,
                fit: BoxFit.fill,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, color: Colors.white),
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

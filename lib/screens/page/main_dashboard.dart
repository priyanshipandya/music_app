import 'package:flutter/material.dart';
import 'package:provider_practical_7/screens/page/profile.dart';
import 'package:provider_practical_7/values/app_styles.dart';
import '../../values/colors.dart';
import 'bookmark.dart';
import 'fab.dart';
import 'homepage/homepage.dart';
import 'message.dart';

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
    const MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: screens),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppStyles.bottomNavRadius,
          boxShadow: [
            AppStyles.navBoxShadow,
          ],
        ),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: AppStyles.bottomNavRadius,
          child: Stack(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildGestureDetector(0, Icons.home_outlined),
                      buildGestureDetector(1, Icons.bookmark_border),
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: AppStyles.navDecoration,
                      ),
                      buildGestureDetector(3, Icons.message_outlined),
                      buildGestureDetector(4, Icons.person_outline_rounded),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: AppStyles.navDialContainerDecor,
                    child: CircleAvatar(backgroundColor: Colors.transparent, radius: 20, child: Image.asset("asset/images/reels.png", height: 40, width: 40, fit: BoxFit.fill)),
                  ),
                ),
              ),
            ],
          ),
        ),
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

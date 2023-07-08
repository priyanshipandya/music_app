import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_practical_7/screens/page/main_dashboard.dart';
import 'package:provider_practical_7/values/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: KColors.kWhite),
      home: const DashboardMainScreen(),
    );
  }
}

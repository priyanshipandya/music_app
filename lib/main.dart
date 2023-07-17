import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_practical_7/screens/page/main_dashboard.dart';
import 'package:provider_practical_7/store/fav_store.dart';
import 'package:provider_practical_7/values/colors.dart';

import 'api/api_service/fetch_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

FavStore favStore = FavStore();
FetchAPIDatas fetchAPI = FetchAPIDatas();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: KColors.kWhite),
      // theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: DashboardMainScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider_practical_7/screens/page/main_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashboardMainScreen(),
    );
  }
}

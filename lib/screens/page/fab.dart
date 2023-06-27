import 'package:flutter/material.dart';
import 'package:provider_practical_7/values/strings.dart';

class FABPage extends StatelessWidget {
  const FABPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Strings.otherPage),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider_practical_7/values/strings.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Strings.bookmarkPage),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_collection.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title = StringCollection.app_title;

  CustomAppBar() : preferredSize = Size.fromHeight(50.0);

  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.grey),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.grey),
    );
  }
}

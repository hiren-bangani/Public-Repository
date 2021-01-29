import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'agri_input_purchase.dart';
import 'string_collection.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(TaxMasterApp());
}

class TaxMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringCollection.app_title,
      home: AgriInputPurchaseRequests(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'string_collection.dart';
import 'side_navbar.dart';
import 'app_bar.dart';

class AgriPurchaseManagement extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SideNavBar(1),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(
              StringCollection.agri_purchase_management,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

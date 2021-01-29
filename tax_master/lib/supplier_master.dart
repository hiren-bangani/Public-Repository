import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'string_collection.dart';
import 'side_navbar.dart';
import 'app_bar.dart';

class SupplierMasterMaintainance extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SideNavBar(3),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(
              StringCollection.supplier_master_maintainance,
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

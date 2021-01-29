import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'string_collection.dart';
import 'side_navbar.dart';
import 'app_bar.dart';

class AgriInputMaintainance extends StatefulWidget {
  AgriInputMaintainanceState createState() => new AgriInputMaintainanceState();
}

class AgriInputMaintainanceState extends State {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SideNavBar(2),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(
              StringCollection.agri_input_maintainance,
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

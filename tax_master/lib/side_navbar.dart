import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_collection.dart';
import 'agri_input_maintainance.dart';
import 'agri_input_purchase.dart';
import 'agri_purchase.dart';
import 'supplier_master.dart';

class SideNavBar extends StatelessWidget {
  int activePageNumber;

  List<bool> activePages;

  SideNavBar(int activePageNumber) {
    this.activePageNumber = activePageNumber;
  }

  Size size;

  Widget build(BuildContext context) {
    activePages = [false, false, false, false];
    activePages[activePageNumber - 1] = true;
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey,
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: CustomListTile(
                    StringCollection.agri_purchase_management, activePages[0]),
                onTap: () {
                  Navigator.of(context).pop();
                  if (activePageNumber != 1)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AgriPurchaseManagement()));
                },
              ),
              getDivider(),
              ListTile(
                title: CustomListTile(
                    StringCollection.agri_input_maintainance, activePages[1]),
                onTap: () {
                  Navigator.of(context).pop();
                  if (activePageNumber != 2)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AgriInputMaintainance()));
                },
              ),
              getDivider(),
              ListTile(
                title: CustomListTile(
                    StringCollection.supplier_master_maintainance,
                    activePages[2]),
                onTap: () {
                  Navigator.of(context).pop();
                  if (activePageNumber != 3)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SupplierMasterMaintainance()));
                },
              ),
              getDivider(),
              ListTile(
                title: CustomListTile(
                    StringCollection.agri_input_purchase, activePages[3]),
                onTap: () {
                  Navigator.of(context).pop();
                  if (activePageNumber != 4)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AgriInputPurchaseRequests()));
                },
              ),
              getDivider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(
                  0,
                  ((size.height - 450) / 2),
                  0,
                  ((size.height - 450) / 2),
                ),
              ),
              getDivider(),
              ListTile(
                title: CustomListTile(StringCollection.app_title, false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDivider() {
    return Divider(
      color: Colors.white,
      indent: 40,
      endIndent: 40,
    );
  }
}

class CustomListTile extends StatelessWidget {
  String title;
  bool bActive = false;

  CustomListTile(String title, bool bActive) {
    this.title = title;
    this.bActive = bActive;
  }

  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    if (bActive) {
      textColor = Colors.blueGrey;
    }
    return Center(
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

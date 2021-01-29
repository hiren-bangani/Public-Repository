import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_collection.dart';
import 'order_listItem.dart';
import 'list_data.dart';

class Executing extends StatefulWidget {
  ExecutingState createState() => new ExecutingState();
}

class ExecutingState extends State {
  Size size;
  int groupOption = 0;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        width: size.width - size.width * 0.03,
        color: Colors.white,
        child: Column(
          children: [
            //Three Buttons
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  SizedBox(width: size.width * 0.015),
                  getButton(StringCollection.undo_batch, Colors.black54),
                  SizedBox(width: size.width * 0.035),
                  getButton(StringCollection.assign_suppliers, Colors.black54),
                  SizedBox(width: size.width * 0.035),
                  getButton(StringCollection.generate_po, Colors.black12),
                  SizedBox(width: size.width * 0.015),
                ],
              ),
            ),
            //Table View for order Details
            Container(
              //Heading
              child: Center(
                child: Container(
                  width: size.width * 0.5,
                  height: size.height * 0.05,
                  child: Center(
                    child: Text(
                      'Executing Agri-Input Orders',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black87,
              indent: size.width * 0.015,
              endIndent: size.width * 0.015,
            ),
            new ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ListData.orders.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return OrderListItem(ListData.orders[index]);
                }),
          ],
        ),
      ),
    );
  }

  Widget getButton(String title, Color color) {
    return Container(
      height: size.height * 0.075,
      width: size.width * 0.3,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

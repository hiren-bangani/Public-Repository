import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_collection.dart';

class Pending extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          StringCollection.pending,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

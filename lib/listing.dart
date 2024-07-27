import 'dart:ui';
import 'package:flutter/material.dart';
import 'colours.dart'; 

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brown,
        title: Text('QuickGigs', style: TextStyle(color: Colors.white)),
      ),
      body: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: AppColors.yellow,
                child: Center(child: Text('Column 1', style: TextStyle(color: Colors.white))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.darkGreen,
                child: Center(child: Text('Column 2', style: TextStyle(color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

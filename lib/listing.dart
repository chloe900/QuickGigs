import 'dart:ui';

import 'package:flutter/material.dart';

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('QuickGigs', style: TextStyle(color: Colors.white)),
        actions: [
          // Add actions here if needed
        ],
      ),
      body: Expanded(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    height: 100,
                    width: double.infinity,
                    child: Center(child: Text('Column 1', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: double.infinity,
                    child: Center(child: Text('Column 2', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

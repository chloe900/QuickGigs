import 'dart:ui';
import 'package:flutter/material.dart';
import 'colours.dart'; 

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brown,
        title: Text('QuickGigs', style: TextStyle(color: Colors.white)),
         actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
    )
  ],      
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
                child: Center(child: Text('', style: TextStyle(color: Colors.white))),
              ),
            ),
            Expanded(
  flex: 1,
  child: Container(
    color: Colors.green[200],
    child: Column(
      children: [
         Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to position the TextField
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.brown,
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.brown),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                borderSide: BorderSide(color: Colors.brown, width: 1),
              ),
            ),
          ),
         ),
      ],
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}




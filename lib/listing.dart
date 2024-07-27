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
       Padding(
  padding: const EdgeInsets.all(16.0), // Add padding to position the clickable text
  child: GestureDetector(
    onTap: () {
      // Handle the click to show subcategories
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 1 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 1', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 2 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 2', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 3 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 3', style: TextStyle(fontSize: 18)),
                  ),
                ),
                // Add more subcategories as needed
              ],
            ),
          );
        },
      );
    },
    child: SizedBox(
      width: double.infinity, // Make the widget fill the horizontal space
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.green, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(color: Colors.green), // Match the border color
        ),
        child: Center(
          child: Text(
            'Location',
            style: TextStyle(color: Colors.white), // Text color
          ),
        ),
      ),
    ),
  ),
),

 Padding(
  padding: const EdgeInsets.all(16.0), // Add padding to position the clickable text
  child: GestureDetector(
    onTap: () {
      // Handle the click to show subcategories
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 1 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 1', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 2 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 2', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 3 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 3', style: TextStyle(fontSize: 18)),
                  ),
                ),
                // Add more subcategories as needed
              ],
            ),
          );
        },
      );
    },
    child: SizedBox(
      width: double.infinity, // Make the widget fill the horizontal space
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.green, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(color: Colors.green), // Match the border color
        ),
        child: Center(
          child: Text(
            'Category',
            style: TextStyle(color: Colors.white), // Text color
          ),
        ),
      ),
    ),
  ),
),
Padding(
  padding: const EdgeInsets.all(16.0), // Add padding to position the clickable text
  child: GestureDetector(
    onTap: () {
      // Handle the click to show subcategories
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 1 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 1', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 2 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 2', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 3 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 3', style: TextStyle(fontSize: 18)),
                  ),
                ),
                // Add more subcategories as needed
              ],
            ),
          );
        },
      );
    },
    child: SizedBox(
      width: double.infinity, // Make the widget fill the horizontal space
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.green, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(color: Colors.green), // Match the border color
        ),
        child: Center(
          child: Text(
            'Availability',
            style: TextStyle(color: Colors.white), // Text color
          ),
        ),
      ),
    ),
  ),
),
Padding(
  padding: const EdgeInsets.all(16.0), // Add padding to position the clickable text
  child: GestureDetector(
    onTap: () {
      // Handle the click to show subcategories
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 1 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 1', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 2 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 2', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle subcategory 3 selection
                    Navigator.pop(context); // Close the modal
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Subcategory 3', style: TextStyle(fontSize: 18)),
                  ),
                ),
                // Add more subcategories as needed
              ],
            ),
          );
        },
      );
    },
    child: SizedBox(
      width: double.infinity, // Make the widget fill the horizontal space
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.green, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(color: Colors.green), // Match the border color
        ),
        child: Center(
          child: Text(
            'Type',
            style: TextStyle(color: Colors.white), // Text color
          ),
        ),
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




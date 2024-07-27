import 'dart:ui';
import 'package:flutter/material.dart';
import 'colours.dart'; 

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final TextEditingController _searchController = TextEditingController();

  void _showSubcategories(String title) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) => GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the modal
                // Add your selection handling logic here
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('$title ${index + 1}', style: TextStyle(fontSize: 18)),
              ),
            )),
          ),
        );
      },
    );
  }

  void _showDialog(String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the dialog
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Option 1', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the dialog
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Option 2', style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the dialog
                    // Add your selection handling logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Option 3', style: TextStyle(fontSize: 18)),
                  ),
                ),
                // Add more options as needed
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brown,
        title: Text('QuickGigs', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Handle user profile action
            },
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.yellow,
              child: Center(child: Text('Some Content', style: TextStyle(color: Colors.white))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green[200],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.brown, width: 1),
                        ),
                      ),
                    ),
                  ),
                  _buildFilterButton('Location'),
                  _buildFilterButton('Category'),
                  _buildFilterButton('Availability'),
                  _buildFilterButton('Type'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Add a Job', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Location',
                           border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Availability',
                           border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Type',
                           border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen.withOpacity(0.9),
                                    foregroundColor: Colors.brown,
                                  ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text('Add Job', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => _showSubcategories(label),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:quick_gigs/payment/payment.dart'; // Import the payment.dart file
import 'package:quick_gigs/review/review.dart';  // Import the review.dart file

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  final String _profilePictureUrl = 'https://example.com/profile_picture.png';
  String _userName = 'John Doe';
  String _userEmail = 'john.doe@example.com';
  String _userPhone = '+1234567890';
  final double _userRating = 4.5;
  final List<Map<String, dynamic>> _userReviews = [
    {
      'reviewerName': 'Jane Smith',
      'reviewText': 'Great job, highly recommend!',
      'reviewRating': 5.0,
    },
    {
      'reviewerName': 'Bob Johnson',
      'reviewText': 'Very professional and timely.',
      'reviewRating': 4.0,
    },
    // Add more reviews as needed
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _editUserField(BuildContext context, String fieldName, String initialValue, Function(String) onSave) {
    final _fieldController = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $fieldName'),
          content: TextField(
            controller: _fieldController,
            decoration: InputDecoration(
              labelText: fieldName,
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  onSave(_fieldController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Profile',
          style: TextStyle(fontFamily: 'Nunito', color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.house, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous page
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(_profilePictureUrl),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () => _editUserField(context, 'Name', _userName, (value) {
                              _userName = value;
                            }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          _userName,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.brown),
                          onPressed: () => _editUserField(context, 'Name', _userName, (value) {
                            _userName = value;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(_userEmail),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.brown),
                          onPressed: () => _editUserField(context, 'Email', _userEmail, (value) {
                            _userEmail = value;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(_userPhone),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.brown),
                          onPressed: () => _editUserField(context, 'Phone', _userPhone, (value) {
                            _userPhone = value;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 4),
                        Text(_userRating.toString(), style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 60), // Increased space between user details and reviews
                Expanded(
                  child: Container(
                    height: 600,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF4CAF50).withOpacity(0.2), // Background color
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF4CAF50).withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          controller: _tabController,
                          labelColor: Colors.brown,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.brown,
                          tabs: [
                            Tab(text: 'Manage Listings'),
                            Tab(text: 'Your Gigs'),
                            Tab(text: 'Reviews'),
                          ],
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ManageListingsTab(),
                              YourGigsTab(),
                              ReviewsTab(userReviews: _userReviews),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ManageListingsTab extends StatelessWidget {
  final List<Map<String, dynamic>> listings = [
    {'title': 'Lawn Mowing', 'status': 'Completed'},
    {'title': 'Dog Walking', 'status': 'In Progress'},
    // Add more listings as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listings.length,
      itemBuilder: (context, index) {
        final listing = listings[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listing['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Status: ${listing['status']}'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Payment()),
                          );
                        },
                        child: Text('Pay'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(66, 139, 70, 1), // Use 'primary' for the background color
                          foregroundColor: Colors.white, // Text color
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Review()),
                          );
                        },
                        child: Text('Review'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown, // Use 'primary' for the background color
                          foregroundColor: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class YourGigsTab extends StatelessWidget {
  final List<Map<String, dynamic>> gigs = [
    {'title': 'Plumbing Job', 'status': 'Pending'},
    {'title': 'Electrical Repair', 'status': 'Accepted'},
    // Add more gigs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gigs.length,
      itemBuilder: (context, index) {
        final gig = gigs[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(gig['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Status: ${gig['status']}'),
                SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Accept'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(66, 139, 70, 1), // Use 'primary' for the background color
                        foregroundColor: Colors.white, // Text color
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Reject'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Use 'primary' for the background color
                        foregroundColor: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ReviewsTab extends StatelessWidget {
  final List<Map<String, dynamic>> userReviews;

  ReviewsTab({required this.userReviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userReviews.length,
      itemBuilder: (context, index) {
        final review = userReviews[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text(review['reviewerName'], style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                Text(review['reviewText']),
                SizedBox(height: 8),
                Row(
                  children: List.generate(
                    review['reviewRating'].round(),
                    (index) => Icon(Icons.star, color: Colors.yellow),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
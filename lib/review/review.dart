import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<Review> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;

  void _submitReview() {
    // Add review submission logic here
    String review = _reviewController.text;
    double rating = _rating;
    // Handle review and rating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7BC67B),
        title: Text(
          'Payment',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Left half with image and title
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/review.png',
                        width: 450,
                        height: 450,
                      ),
                      SizedBox(height: 20),
                      Text('Job Reviews', style: TextStyle(fontSize: 34)),
                    ],
                  ),
                ),
                // Right half with review elements
                Expanded(
                  child: Center(
                    child: Container(
                      width: 400, // Increased width
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Make column size minimal
                        mainAxisAlignment: MainAxisAlignment.center, // Center contents vertically
                        children: [
                          Text('Write a Review', style: TextStyle(color: Colors.brown, fontSize: 40)),
                          SizedBox(height: 20),
                          TextField(
                            controller: _reviewController,
                            maxLines: 5, // Increased size for the review text box
                            decoration: InputDecoration(
                              labelText: 'Your Review',
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
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                _rating = rating;
                              });
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _submitReview,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen.withOpacity(0.9),
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // House icon button at the top left corner
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: Icon(Icons.house, color: Colors.brown),
              onPressed: () {
                Navigator.pop(context); // Navigate to the main landing page
              },
            ),
          ),
        ],
      ),
    );
  }
}

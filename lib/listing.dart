import 'dart:ui';
import 'package:flutter/material.dart';
import 'colours.dart';

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final int totalContainers = 15; // Total number of containers you want to display
  final int containersBeforeRecommendation = 6; // Number of containers before recommendation
  final int containersAfterRecommendation = 3; // Number of containers after recommendation
  final int containersAfterHighlighted = 6; // Number of containers after highlighted section

  void _showJobDetails(BuildContext context, String jobTitle, String employer, String rate, String hours, String description, String location) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 700, // Adjust width to have 15 px margin on each side
              height: MediaQuery.of(context).size.height - 300, // Adjust height to have 16 px margin on each side
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    jobTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 16.0),
                  Text('Employer: $employer'),
                  SizedBox(height: 8.0),
                  Text('Rate per Hour: $rate'),
                  SizedBox(height: 8.0),
                  Text('Hours: $hours'),
                  SizedBox(height: 8.0),
                  Text('Description: $description'),
                  SizedBox(height: 8.0),
                  Text('Location: $location'),
                  Spacer(), // Pushes the buttons to the bottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your request action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGreen,
                          foregroundColor: AppColors.textBlack,  // Set the color of the Request button
                        ),
                        child: Text('Request'),
                      ),
                    ],
                  ),
                ],
              ),
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
      ),
      body: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: AppColors.lightGreen,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: totalContainers + 6, // Plus six for the heading, recommendation, two paddings, sized box, and extra padding
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // "Find your next job" text
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Find your next job',
                                style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                              ),
                            );
                          }

                          if (index == containersBeforeRecommendation + 1) {
                            // "Recommendation" text
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Recommendation',
                                style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                              ),
                            );
                          }

                          if (index == containersBeforeRecommendation + containersAfterRecommendation + 2) {
                            // SizedBox between highlighted and non-highlighted containers
                            return SizedBox(height: 50.0);
                          }

                          if (index > containersBeforeRecommendation &&
                              index <= containersBeforeRecommendation + containersAfterRecommendation + 1) {
                            // Highlighted containers after recommendation
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16.0, // Space between containers
                                left: 16.0,  // Left padding
                                right: 16.0, // Right padding
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _showJobDetails(
                                    context,
                                    'Job Title ${index + 1 - containersBeforeRecommendation}', // Job title
                                    'Employer Username', // Placeholder for employer username
                                    'R10/hr', // Placeholder for rate per hour
                                    '2 hours', // Placeholder for hours
                                    'Job description goes here.', // Placeholder for description
                                    'Location', // Placeholder for location
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.0),
                                  width: double.infinity,
                                  height: 100.0, // Set height to 100
                                  decoration: BoxDecoration(
                                    color: AppColors.brown, // Changed color to brown
                                    borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                        offset: Offset(0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Job Title ${index + 1 - containersBeforeRecommendation}', // Job title
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              'Employer Username', // Placeholder for employer username
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              'Location', // Placeholder for location
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Text(
                                          'Wage: R10/hr', // Placeholder for wage per hour
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }

                          if (index > containersBeforeRecommendation + containersAfterRecommendation + 2 &&
                              index <= containersBeforeRecommendation + containersAfterRecommendation + containersAfterHighlighted + 3) {
                            // Non-highlighted containers after highlighted boxes
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16.0, // Space between containers
                                left: 16.0,  // Left padding
                                right: 16.0, // Right padding
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _showJobDetails(
                                    context,
                                    'Job Title ${index + 1 - containersBeforeRecommendation - containersAfterRecommendation - 2}', // Job title
                                    'Employer Username', // Placeholder for employer username
                                    'R10/hr', // Placeholder for rate per hour
                                    '2 hours', // Placeholder for hours
                                    'Job description goes here.', // Placeholder for description
                                    'Location', // Placeholder for location
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.0),
                                  width: double.infinity,
                                  height: 100.0, // Set height to 100
                                  decoration: BoxDecoration(
                                    color: AppColors.darkGreen,
                                    borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Job Title ${index + 1 - containersBeforeRecommendation - containersAfterRecommendation - 2}', // Job title
                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              'Employer Username', // Placeholder for employer username
                                              style: TextStyle(color: Colors.black),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              'Location', // Placeholder for location
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Text(
                                          'Wage: R10/hr', // Placeholder for wage per hour
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }

                          // Default container
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16.0, // Space between containers
                              left: 16.0,  // Left padding
                              right: 16.0, // Right padding
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _showJobDetails(
                                  context,
                                  'Job Title ${index + 1}', // Job title
                                  'Employer Username', // Placeholder for employer username
                                  'R10/hr', // Placeholder for rate per hour
                                  '2 hours', // Placeholder for hours
                                  'Job description goes here.', // Placeholder for description
                                  'Location', // Placeholder for location
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                width: double.infinity,
                                height: 100.0, // Set height to 100
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreen,
                                  borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Job Title ${index + 1}', // Job title
                                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'Employer Username', // Placeholder for employer username
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'Location', // Placeholder for location
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Text(
                                        'Wage: R10/hr', // Placeholder for wage per hour
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.darkGreen,
                child: Center(
                  child: Text(
                    'Column 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

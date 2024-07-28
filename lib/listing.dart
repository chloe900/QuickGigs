import 'dart:async';
import 'package:flutter/material.dart';
import 'colours.dart'; // Import your colors file
import 'profile/profile.dart';
import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart' as aws_dynamodb_api;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
}

final _credentials = aws_dynamodb_api.AwsClientCredentials(
  accessKey: dotenv.env['AWS_ACCESS_KEY_ID']!,
  secretKey: dotenv.env['AWS_SECRET_ACCESS_KEY']!,
);

final _dynamoDb = aws_dynamodb_api.DynamoDB(
  region: 'us-west-1',
  credentials: _credentials,
);

class Job {
  final double jobId;
  final String title;
  final String description;
  final double ratePerHour;
  final String date;
  final String location;
  final String category;
  final String status;
  final double userID;

  Job({
    required this.jobId,
    required this.title,
    required this.description,
    required this.ratePerHour,
    required this.date,
    required this.location,
    required this.category,
    required this.status,
    required this.userID,
  });

  factory Job.fromMap(Map<String, aws_dynamodb_api.AttributeValue> map) {
    double parseDouble(aws_dynamodb_api.AttributeValue attribute) {
      return attribute.n != null ? double.parse(attribute.n!) : 0.0;
    }

    String parseString(aws_dynamodb_api.AttributeValue attribute) {
      return attribute.s ?? '';
    }

    return Job(
      jobId: parseDouble(map['JobID']!),
      title: parseString(map['Title']!),
      description: parseString(map['Description']!),
      ratePerHour: parseDouble(map['R/hr']!),
      date: parseString(map['Dates_Posted']!),
      location: parseString(map['Location']!),
      category: parseString(map['Category']!),
      status: parseString(map['Status']!),
      userID: parseDouble(map['UserID']!),
    );
  }
}

Future<List<Job>> fetchJobs() async {
  try {
    final response = await _dynamoDb.scan(tableName: 'Gigs');
    if (response.items == null) {
      throw Exception('No items found in response');
    }

    return response.items!.map((item) => Job.fromMap(item)).toList();
  } catch (e) {
    print('Error fetching jobs: $e'); // Logging the error
    return []; // Return an empty list on error
  }
}

class ListingPage extends StatefulWidget {
  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<Job>> _jobsFuture;

  @override
  void initState() {
    super.initState();
    _jobsFuture = fetchJobs(); // Fetch jobs when the widget is initialized
  }

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
                Navigator.pop(context); 
                // selection handling logic here
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

  void _showJobDetails(BuildContext context, Job job) {
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
                    job.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 16.0),
                  Text('Employer: ${job.userID}'),
                  SizedBox(height: 8.0),
                  Text('Rate per Hour: ${job.ratePerHour}'),
                  SizedBox(height: 8.0),
                  Text('Description: ${job.description}'),
                  SizedBox(height: 8.0),
                  Text('Location: ${job.location}'),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
         IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () async {
            try {
              await Amplify.Auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            } catch (e) {
              print('Error signing out: $e');
            }
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
                color: AppColors.lightGreen,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Header for "Find your next job"
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Find your next job',
                        style: TextStyle(
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Job>>(
                        future: _jobsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Center(child: Text('No jobs available'));
                          } else {
                            final jobs = snapshot.data!;
                            return ListView.builder(
                              itemCount: jobs.length + 3, // Additional items for headings and spacing
                              itemBuilder: (context, index) {
                                if (index == 0) {
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

                                if (index == 1) {
                                  return SizedBox(height: 16.0);
                                }

                                if (index - 2 < jobs.length) {
                                  final job = jobs[index - 2];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _showJobDetails(context, job);
                                      },
                                      child: Container(
                                        color: AppColors.darkGreen,
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              job.title,
                                              style: TextStyle(
                                                color: AppColors.textBlack,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              job.location,
                                              style: TextStyle(
                                                color: AppColors.textBlack,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              job.description,
                                              style: TextStyle(
                                                color: AppColors.textBlack,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    color: AppColors.brown,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Recommendation',
                                      style: TextStyle(
                                        color: AppColors.textBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
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
                color: AppColors.lightGreen,
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
                          labelText: 'Province',
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
import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'dart:convert';

class Job {
  final String jobId;
  final String title;
  final String description;
  final double ratePerHour;
  final String date;
  final String location;

  Job({
    required this.jobId,
    required this.title,
    required this.description,
    required this.ratePerHour,
    required this.date,
    required this.location,
  });

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      jobId: map['JobID']['S'] as String,
      title: map['Title']['S'] as String,
      description: map['Description']['S'] as String,
      ratePerHour: double.parse(map['R/hr']['N']),
      date: map['Date']['S'] as String,
      location: map['Location']['S'] as String,
    );
  }
}

Future<List<Job>> fetchJobs() async {
  final response = await _dynamoDb.scan(ScanInput(
    tableName: 'YourTableName',
  ));

  return response.items!
      .map((item) => Job.fromMap(item))
      .toList();
}

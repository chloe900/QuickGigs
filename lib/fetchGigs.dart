// fetchGigs.dart
import 'dart:convert'; // If you're fetching from a JSON API
import 'package:http/http.dart' as http;
import 'fetch_model.dart';

Future<List<Job>> fetchJobs() async {
  // Replace with your API endpoint
  final response = await http.get(Uri.parse('https://4cjqsw6pm8.execute-api.us-west-1.amazonaws.com/dev'));

if (response.statusCode == 200) {
  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((job) => Job(
    title: job['title'] ?? 'N/A',
    employer: job['employer'] ?? 'N/A',
    rate: job['rate'] ?? 'N/A',
    hours: job['hours'] ?? 'N/A',
    description: job['description'] ?? 'N/A',
    location: job['location'] ?? 'N/A',
  )).toList();
} else {
  throw Exception('Failed to load jobs: ${response.reasonPhrase}');
}

}

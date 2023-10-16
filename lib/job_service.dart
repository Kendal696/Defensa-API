import 'dart:convert';
import 'package:http/http.dart' as http;
import 'job.dart';

class JobService {
  final String baseUrl = "https://www.arbeitnow.com/api/job-board-api";

  Future<List<Job>> fetchJobs() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      return body.map((dynamic item) => Job.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load jobs');
    }
  }
}

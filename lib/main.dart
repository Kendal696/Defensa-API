import 'package:flutter/material.dart';
import 'job.dart';
import 'job_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobList(),
    );
  }
}

class JobList extends StatefulWidget {
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final JobService jobService = JobService();
  late Future<List<Job>> futureJobs;

  @override
  void initState() {
    super.initState();
    futureJobs = jobService.fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: FutureBuilder<List<Job>>(
        future: futureJobs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.star, color: Colors.yellow),
            title: Text(snapshot.data![index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data![index].companyName),
                SizedBox(height: 5),
                Text("Salario: 3144"),
              ],
            ),
            trailing: Icon(Icons.favorite, color: Colors.red),
          ),
        );
      },
    );
          } else {
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

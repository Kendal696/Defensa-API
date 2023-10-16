class Job {
  final String companyName;
  final String title;
  final String description;
  final String url;
  final List<String> tags;
  final List<String> jobTypes;
  final String location;
  Job({
    required this.companyName,
    required this.title,
    required this.description,
    required this.url,
    required this.tags,
    required this.jobTypes,
    required this.location,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      companyName: json['company_name'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      tags: List<String>.from(json['tags']),
      jobTypes: List<String>.from(json['job_types']),
      location: json['location'],
    );
  }
}

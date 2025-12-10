import 'package:flutter/material.dart';
import 'package:internshala/Screens/JobApi/JobApi.dart';

class JobDetailsPage extends StatefulWidget {
  final int jobId;
  const JobDetailsPage({super.key, required this.jobId});

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  Map<String, dynamic>? jobData;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadJobDetails();
  }

  Future<void> loadJobDetails() async {
    final response = await JobApi().getJobById(widget.jobId);

    if (response["success"]) {
      setState(() {
        jobData = response["data"];
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = response["message"];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Details"),
        backgroundColor: Colors.blueAccent,
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(child: Text(errorMessage!))
          : jobData == null
          ? const Center(child: Text("No Job Found"))
          : buildJobUI(jobData!),
    );
  }

  Widget buildJobUI(Map<String, dynamic> job) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (job["companyLogoUrl"] != null)
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(job["companyLogoUrl"]),
              ),
            ),

          const SizedBox(height: 20),

          Text(
            job["title"] ?? "",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            job["companyName"] ?? "",
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey[700]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  job["location"] ?? "Not Provided",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.work_outline),
              const SizedBox(width: 8),
              Text(
                job["jobType"] ?? "N/A",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            "Salary: ${job["minSalary"]} - ${job["maxSalary"]} ${job["salaryCurrency"]}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 20),

          sectionTitle("Description"),
          textBlock(job["description"]),

          sectionTitle("Responsibilities"),
          textBlock(job["responsibilities"]),

          sectionTitle("Qualifications"),
          textBlock(job["qualifications"]),

          sectionTitle("Experience Required"),
          textBlock(job["experienceRequired"]),

          sectionTitle("Skills Required"),

          Wrap(
            spacing: 8,
            children: List.generate(
              job["skills"]?.length ?? 0,
              (i) => Chip(label: Text(job["skills"][i])),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget textBlock(text) {
    return Text(
      text ?? "Not Provided",
      style: const TextStyle(fontSize: 16, height: 1.4),
    );
  }
}

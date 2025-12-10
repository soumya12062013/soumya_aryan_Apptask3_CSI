import 'package:flutter/material.dart';
import 'package:internshala/Screens/JobApi/JobApi.dart';
import 'package:internshala/models/job_model.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Job_details_page.dart';
import 'package:internshala/Widget/bottom_nav_seeker.dart';
import 'package:internshala/Screens/Job_Seeker_screen/HomeScreen.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Job_Seeker_Chat_page.dart';
import 'package:internshala/Screens/Job_Seeker_screen/JobSeeker_Profile.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({super.key});

  @override
  State<JobListPage> createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  List<JobModel> jobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJobs();
  }

  Future<void> loadJobs() async {
    final response = await JobApi().getAllJobs();

    if (response["success"]) {
      List<JobModel> loadedJobs = [];

      for (var job in response["jobs"]) {
        loadedJobs.add(JobModel.fromJson(job));
      }

      setState(() {
        jobs = loadedJobs;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Jobs"),
        backgroundColor: Colors.blueAccent,
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : jobs.isEmpty
          ? const Center(child: Text("No jobs available"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return buildJobCard(jobs[index]);
              },
            ),
      bottomNavigationBar: SafeArea(
        child: JobSeekerBottomNavigation(
          currentIndex: 1,
          onTabSelected: (index) {
            if (index == 0) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const Jobs()),
                (route) => false,
              );
            } else if (index == 1) {
              // Already on Jobs page
            } else if (index == 2) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MessagesScreen()),
                (route) => false,
              );
            } else if (index == 3) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const SeekerBioScreen()),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildJobCard(JobModel job) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => JobDetailsPage(jobId: job.id)),
          );
        },
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: job.companyLogoUrl != null
              ? NetworkImage(job.companyLogoUrl!)
              : const AssetImage("assets/default_company.png") as ImageProvider,
        ),
        title: Text(
          job.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${job.companyName}\n${job.location}",
          style: const TextStyle(height: 1.4),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${job.minSalary}-${job.maxSalary} ${job.salaryCurrency}",
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(job.jobType, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

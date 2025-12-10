import 'package:flutter/material.dart';
import 'package:internshala/Widget/BottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:internshala/Screens/Job_Giver_screen/Job_Giver_chat_page.dart';
import 'package:internshala/Screens/Job_Giver_screen/Job_Giver_profile_page.dart';
import 'package:internshala/Screens/Job_Giver_screen/Job_posting_screen.dart';

class JobGiverAboutPage extends StatefulWidget {
  const JobGiverAboutPage({super.key});

  @override
  State<JobGiverAboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<JobGiverAboutPage> {
  final textStyleHeader = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.indigo[900],
  );

  final textStyleBody = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    height: 1.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: BottomNavigation(
          currentIndex: 1,
          onTabSelected: (index) async {
            final prefs = await SharedPreferences.getInstance();
            final userRole = prefs.getString("userRole") ?? "JOBSEEKER";
        
            if (userRole == "JobGiver") {
              if (index == 0) {
                return;
              }
        
              if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => JobGiverAboutPage()),
                );
              }
        
              if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => JobGiverChatPage()),
                );
              }
        
              if (index == 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => RecruiterBioScreen()),
                );
              }
              return;
            }
          },
          onAddPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => JobPostingScreen()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/Images/logo.jpg',
                height: 50,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                "About NextStep",
                style: textStyleHeader,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to NextStep, a vibrant community dedicated to helping junior professionals in the creative field find their dream jobs. Connect with employers, showcase your talents, and take the next step in your career journey with us. Join our network of talented individuals and innovative companies today.",
                style: textStyleBody,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              Image.asset(
                'Assets/Images/group_person.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                "Vision",
                style: textStyleHeader,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Our vision is to create unparalleled economic opportunities for every junior creative professional worldwide, empowering them to achieve their career goals and contribute to the global workforce.",
                style: textStyleBody,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              Image.asset(
                'Assets/Images/group_person1.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                "Mission",
                style: textStyleHeader,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Our mission is simple: to connect junior creative professionals with opportunities that inspire and enable them to grow, thrive, and succeed in their careers.",
                style: textStyleBody,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),
              Image.asset(
                'Assets/Images/group_person1.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                "Who are we?",
                style: textStyleHeader,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "NextStep started as an idea in 2025, born out of a desire to help junior creative professionals find meaningful job opportunities. Officially launched in 2025, NextStep has quickly grown into a dynamic platform, connecting talented individuals with innovative companies. Under visionary leadership, NextStep continues to expand, offering job listings, career resources, and networking opportunities to support the next generation of creative professionals.",
                style: textStyleBody,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

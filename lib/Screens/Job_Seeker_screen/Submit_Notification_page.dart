import 'package:flutter/material.dart';
import 'package:internshala/Screens/Job_Giver_screen/HomeScreen.dart';
//import 'package:next_steps/Screens/Job_Seeker_screen/Job_Seeker_Job_page.dart';

class ApplicationSubmittedScreen extends StatelessWidget {
  const ApplicationSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'Assets/Images/group_person1.png',
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(height: 25),

              Text(
                'Your Application Has Been',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),

              Text(
                'Submitted!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),

              // Info text
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You will get an email confirmation at xyz@gmail.com',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This employer typically responds to applications within 1 day.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Keep track of your applications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),

              Text(
                'You will receive a status update in an email from NextStep within a few weeks of submitting your application. In the meantime, you can view and track all your applications in the NextStep Jobs section at any time.',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              SizedBox(height: 10),

              GestureDetector(
                onTap: () {},
                child: Text(
                  'Check your applications on Recent Activities',
                  style: TextStyle(
                    color: Colors.indigo,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade900,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Return to a job search',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50),

              Divider(thickness: 0.5),
              SizedBox(height: 10),
              Text(
                '© 2025 NextStep. All rights reserved.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

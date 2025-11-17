import 'package:flutter/material.dart';
import 'package:next_steps/Screens/Auth_Screen/Login_screen.dart';
import 'package:next_steps/Screens/Auth_Screen/Signin_screen.dart';

class PromotionScreen extends StatelessWidget {
   PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'Assets/Images/promotion.png',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        '"Find Your Next Opportunity,\nHire Your Perfect Candidate"',
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 10),
                       Text(
                        'The all-in-one platform that connects top talent with leading companies.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                       SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                        MaterialPageRoute(
                       builder: (context) => LoginScreen(),
                      ),
                          );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child:  Text('Log in',style: TextStyle(color: Colors.white),
                            ),
                          ),
                           SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                        MaterialPageRoute(
                       builder: (context) => SignUpScreen(),
                      ),
                          );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child:  Text('Sign up'
                              ,style: TextStyle(color: Colors.white),
                          ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

             SizedBox(height: 20),

           
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                padding:  EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Center(
                      child: Text(
                        'Find the job you love ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     SizedBox(height: 12),
                    _buildFeature(
                      icon: Icons.auto_awesome,
                      title: 'AI-Powered Matching',
                      desc:
                          'Get matched with jobs that fit your skills and experience.',
                    ),
                    _buildFeature(
                      icon: Icons.message_outlined,
                      title: 'Direct Messaging',
                      desc: 'Connect directly with hiring managers.',
                    ),
                    _buildFeature(
                      icon: Icons.person_outline,
                      title: 'Profile Builder',
                      desc:
                          'Showcase your experience with a beautiful profile.',
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 20),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                padding:  EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Center(
                      child: Text(
                        'Hire the talent you need ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     SizedBox(height: 12),
                    _buildFeature(
                      icon: Icons.verified_user_outlined,
                      title: 'Vetted Candidate Pool',
                      desc:
                          'Access thousands of qualified professionals ready to work.',
                    ),
                    _buildFeature(
                      icon: Icons.work_outline,
                      title: 'Easy Job Posting',
                      desc: 'Post openings quickly and easily.',
                    ),
                    _buildFeature(
                      icon: Icons.dashboard_customize_outlined,
                      title: 'Applicant Management',
                      desc:
                          'Track and manage candidates all in one place.',
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 30),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'Assets/Images/room_promotion.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue[900], size: 28),
           SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                 SizedBox(height: 4),
                Text(
                  desc,
                  style:  TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

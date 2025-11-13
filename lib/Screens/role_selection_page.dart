import 'package:flutter/material.dart';
import 'package:next_steps/Screens/network_screen.dart';


class RoleSelectionPage extends StatefulWidget {
   const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
 // NetworkTab _currentTab = NetworkTab.suggestions;
 // int _bottomIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 // Icon(Icons.next_plan, color: Colors.indigo[900]),
                 Image.asset('Assets/Images/logo.jpg', height: 30,fit: BoxFit.contain),
                   SizedBox(width: 6),
                  Text(
                    'NextStep',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
           padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
           children: [
                Wrap(
                 alignment: WrapAlignment.center,
                 spacing: 16,
                runSpacing: 8,
              children:  [
               Text('Infosys', style: TextStyle(fontSize: 18)),
               Text('Microsoft', style: TextStyle(fontSize: 18)),
               Text('Amazon', style: TextStyle(fontSize: 18)),
               Text('Accenture', style: TextStyle(fontSize: 18)),
               Text('Google', style: TextStyle(fontSize: 18)),
              ],
              ),
               SizedBox(height: 16),
              Image.asset(
                'Assets/Images/rolepageimg2.png',   
                  height: 180,
                  fit: BoxFit.contain,
                ),
              SizedBox(height: 20),
              Image.asset(
                 'Assets/Images/rolepageimg1.png', 
                     height: 180,
                    fit: BoxFit.contain,
              ),
            ],
           ),
         ),
             SizedBox(height: 20),
            
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset:  Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Become a Candidate",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(height: 8),
                     Text(
                      "Connect with recruiters and take the next step in your career.",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                     SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:  EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                      child:  Text("Apply Now",style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 24),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset:  Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Become an Employer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(height: 8),
                     Text(
                      "Hire the best talent for your team. Post jobs, manage applications, and grow your company effortlessly.",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                     SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:  EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                      child:  Text("Start Hiring",style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 30),

            // Footer Section
            Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1C2751), Color(0xFF26355D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "NextStep",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                   SizedBox(height: 8),
                   Text(
                    "Great platform for job seekers passionate about startups. Find your dream job easier.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                   SizedBox(height: 20),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text("About",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text("Companies",
                                style: TextStyle(color: Colors.white70)),
                            Text("Pricing",
                                style: TextStyle(color: Colors.white70)),
                            Text("Terms",
                                style: TextStyle(color: Colors.white70)),
                            Text("Advice",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text("Resources",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 6),
                            Text("Help Docs",
                                style: TextStyle(color: Colors.white70)),
                            Text("Guide",
                                style: TextStyle(color: Colors.white70)),
                            Text("Updates",
                                style: TextStyle(color: Colors.white70)),
                            Text("Contact Us",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),

                   SizedBox(height: 20),
                   Text(
                    "Get job notifications",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style:  TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            hintStyle:  TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.white12,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                 EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                      ),
                       SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[900],
                          padding:  EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                        ),
                        child:  Text("Subscribe",style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                   SizedBox(height: 30),
                   Center(
                    child: Text(
                      "© 2025 NextStep. All rights reserved.",
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //   bottomNavigationBar: NavigationBar(
    //     selectedIndex: _bottomIndex,
    //     onDestinationSelected: (i) => setState(() => _bottomIndex = i),
    //     destinations:  [
    //       NavigationDestination(
    //         icon: Icon(
    //           Icons.home_outlined
    //           ), 
    //           selectedIcon: Icon(
    //             Icons.home
    //             ), 
    //             label: 'Home'
    //             ),
    //       NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Search'),
    //       NavigationDestination(icon: Icon(Icons.people_alt_outlined), selectedIcon: Icon(Icons.people_alt), label: 'Network'),
    //       NavigationDestination(icon: Icon(Icons.mail_outline), selectedIcon: Icon(Icons.mail), label: 'Messages'),
    //       NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
    //     ],
    //   ),
    // );
  }
}

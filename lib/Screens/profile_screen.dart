import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 180,
              width: double.infinity,
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child:  SizedBox(),
            ),

            // PROFILE CARD
            Transform.translate(
              offset:  Offset(0, -50),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('Assets/Images/stevejobs.png'), // replace with your image
                  ),
                   SizedBox(height: 10),
                   Text(
                    'John Doe',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                   Text('Full Stack Developer'),
                   SizedBox(height: 6),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text('San Francisco, CA'),
                    ],
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text(
                      'Passionate developer with 5+ years of experience in building web applications.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, size: 18),
                      SizedBox(width: 6),
                      Text('user@example.com'),
                      SizedBox(width: 16),
                      Icon(Icons.phone_outlined, size: 18),
                      SizedBox(width: 6),
                      Text('+1 (555) 123-4567'),
                    ],
                  ),
                   SizedBox(height: 20),
                ],
              ),
            ),

            // SECTIONS
            _buildSectionTitle('Skills', icon: Icons.code),
            _buildChips(['React', 'Node.js', 'TypeScript', 'Python', 'AWS']),

            _buildSectionTitle('Experience', icon: Icons.work_outline),
            _buildExperience(
              title: 'Senior Full Stack Developer',
              company: 'Tech Solutions Inc.',
              date: '2021 - Present',
              desc:
                  'Leading development of web applications using React and Node.js',
            ),
            _buildExperience(
              title: 'Full Stack Developer',
              company: 'StartUp Co.',
              date: '2019 - 2021',
              desc: 'Built and maintained multiple client projects',
            ),

            _buildSectionTitle('Education', icon: Icons.school_outlined),
            _buildEducation(
              degree: 'Bachelor of Science in Computer Science',
              university: 'University of California',
              years: '2015 - 2019',
            ),

            _buildSectionTitle('Certifications', icon: Icons.verified_outlined),
            _buildCertifications([
              'AWS Certified Developer',
              'Google Cloud Professional',
            ]),

            _buildSectionTitle('Account Settings', icon: Icons.settings_outlined),
            _buildLogoutButton(context),
             SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ---------- COMPONENTS BELOW ----------

  static Widget _buildSectionTitle(String title, {IconData? icon}) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(20, 15, 20, 5),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 18),
          if (icon != null)  SizedBox(width: 8),
          Text(
            title,
            style:  TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildChips(List<String> skills) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Wrap(
        spacing: 10,
        children: skills
            .map((skill) => Chip(
                  label: Text(skill),
                  backgroundColor: Colors.blue.shade50,
                ))
            .toList(),
      ),
    );
  }

  static Widget _buildExperience({
    required String title,
    required String company,
    required String date,
    required String desc,
  }) {
    return ListTile(
      leading:  Icon(Icons.business_center_outlined, color: Colors.blue),
      title: Text(title, style:  TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$company\n$date'),
           SizedBox(height: 4),
          Text(desc),
        ],
      ),
    );
  }

  static Widget _buildEducation({
    required String degree,
    required String university,
    required String years,
  }) {
    return ListTile(
      leading:  Icon(Icons.school, color: Colors.purple),
      title: Text(degree, style:  TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$university\n$years'),
    );
  }

  static Widget _buildCertifications(List<String> certs) {
    return Column(
      children: certs
          .map((cert) => ListTile(
                leading:
                     Icon(Icons.verified, color: Colors.amber, size: 22),
                title: Text(cert),
              ))
          .toList(),
    );
  }

  static Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading:  Icon(Icons.logout, color: Colors.red),
        title:  Text('Logout', style: TextStyle(color: Colors.red)),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Logged out successfully')),
          );
        },
      ),
    );
  }

  static Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 4,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline), label: 'Network'),
        BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

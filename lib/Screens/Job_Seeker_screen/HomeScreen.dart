import 'package:flutter/material.dart';
import 'package:internshala/Widget/Card.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:internshala/Widget/bottom_nav_seeker.dart';
import 'package:internshala/Screens/Job_Seeker_screen/JobSeeker_Profile.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Job_Seeker_Chat_page.dart';
import 'package:internshala/Screens/Job_Seeker_screen/job_list_page.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: SafeArea(
        child: JobSeekerBottomNavigation(
          currentIndex: 0,
          onTabSelected: (index) async {
            if (index == 0) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const Jobs()),
                (route) => false,
              );
            } else if (index == 1) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const JobListPage()),
                (route) => false,
              );
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 2,
                    color: const Color.fromARGB(255, 223, 222, 222),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search for a job or company",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 5, 48, 83),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Recommendation',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Cards(
                    company: 'Google',
                    jobRole: 'Senior Product Designer',
                    salary: '2000-4000',
                    shift: 'onsite',
                    site: 'full Time',
                    image: 'Assets/Images/image.png',
                  ),

                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 5, 48, 83),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Recent Jobs',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Cards(
                    company: 'Meta',
                    jobRole: 'Software Developer',
                    salary: '2000-4000',
                    shift: 'onsite',
                    site: 'full Time',
                    image: 'Assets/Images/meta.png',
                  ),

                  const SizedBox(height: 30),

                  Cards(
                    company: 'Apple',
                    jobRole: 'Senior Product Designer',
                    salary: '2000-4000',
                    shift: 'onsite',
                    site: 'Half time',
                    image: 'Assets/Images/apple.jpeg',
                  ),

                  const SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Color.fromARGB(255, 147, 191, 227),
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('Assets/Images/rolepageimg2.jpg'),
                        fit: BoxFit.cover,
                        opacity: 0.25,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF06345A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Most Searched Jobs:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        _jobItem("Graphic Designer"),
                        _jobItem("Photographer"),
                        _jobItem("Front End Developer"),
                        _jobItem("Data Analyst"),
                        _jobItem("Accountant"),
                        _jobItem("Full Stack Developer"),
                        _jobItem("Senior Lecturer"),
                        _jobItem("UX Designer"),
                      ],
                    ),
                  ),

                  categoryCard('Technology & IT', LucideIcons.table),
                  categoryCard('Finance', LucideIcons.trendingUp),
                  categoryCard('Design & Creativity', LucideIcons.penTool),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 180, 194, 206),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Search by Job Title",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Job title or company",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Location",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: null,
                      hint: const Text("Choose city"),
                      items: ["Delhi", "Mumbai", "Bangalore", "Hyderabad"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Category",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 10),
                _filterCheck("Commerce"),
                _filterCheck("Telecommunications"),
                _filterCheck("Hotels & Tourism"),
                _filterCheck("Education"),
                _filterCheck("Financial Services"),

                const SizedBox(height: 8),

                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D2C4F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Show More"),
                  ),
                ),

                const SizedBox(height: 25),
                const Text(
                  "Job Type",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                _filterCheck("Full Time"),
                _filterCheck("Part Time"),
                _filterCheck("Freelance"),
                _filterCheck("Seasonal"),
                _filterCheck("Fixed-Price"),

                const SizedBox(height: 25),

                const Text(
                  "Experience Level",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                _filterCheck("No-experience"),
                _filterCheck("Fresher"),
                _filterCheck("Intermediate"),
                _filterCheck("Expert"),

                const SizedBox(height: 25),

                const Text(
                  "Date Posted",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                _filterCheck("All"),
                _filterCheck("Last Hour"),
                _filterCheck("Last 24 Hours"),
                _filterCheck("Last 7 Days"),
                _filterCheck("Last 30 Days"),

                const SizedBox(height: 25),

                const Text(
                  "Salary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                Slider(value: 5000, min: 0, max: 10000, onChanged: (value) {}),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Salary: ₹0 - ₹9999"),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Apply"),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                const Text(
                  "Tags",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _tagChip("engineering"),
                    _tagChip("design"),
                    _tagChip("ux/ui"),
                    _tagChip("marketing"),
                    _tagChip("management"),
                    _tagChip("soft."),
                    _tagChip("construction"),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _jobItem(String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget categoryCard(String title, IconData icon) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF0D2C4F),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterCheck(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (v) {}),
            Text(title),
          ],
        ),
        const Text("10"),
      ],
    );
  }
}

class _tagChip extends StatelessWidget {
  final String label;
  const _tagChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE9F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

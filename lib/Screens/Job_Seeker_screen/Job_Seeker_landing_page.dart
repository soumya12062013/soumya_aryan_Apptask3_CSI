import 'package:flutter/material.dart';

class JobSeekerLandingPage extends StatelessWidget {
  // JobGiverLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('Assets/Images/logo.jpg', height: 24),
             SizedBox(width: 8),
             Text('NextStep',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions:  [
          Icon(Icons.chat_bubble_outline, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.person_outline, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          // Hero Section
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('Assets/Images/promotion.png',
                  height: 250, width: double.infinity, fit: BoxFit.cover),
              Container(
                color: Colors.black.withValues(alpha: 0.4),
                height: 250,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Text(
                        "Find Your Dream Job Today!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Connecting Talent with Opportunities",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Search Box
          Padding(
            padding:  EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Job Title or Company",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
                 SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Location",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),
                        items:  [
                          DropdownMenuItem(
                              value: "India", child: Text("India")),
                          DropdownMenuItem(
                              value: "USA", child: Text("USA")),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                     SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: "Select Category",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),
                        items:  [
                          DropdownMenuItem(
                              value: "Tech", child: Text("Technology")),
                          DropdownMenuItem(
                              value: "Design", child: Text("Design")),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    minimumSize:  Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  icon:  Icon(Icons.search, color: Colors.white),
                  label:  Text("Search Job",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),

          // Top Companies
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text("Top Companies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:  EdgeInsets.symmetric(horizontal: 16),
              children:  [
                CompanyCard(name: "Instagram", jobs: 8, logo: Icons.camera_alt),
                CompanyCard(name: "Tesla", jobs: 10, logo: Icons.electric_car),
                CompanyCard(name: "McDonald's", jobs: 12, logo: Icons.fastfood),
                CompanyCard(name: "Apple", jobs: 9, logo: Icons.apple),
              ],
            ),
          ),

          // Steps Section
           Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: StepsSection(),
          ),

          // Featured Jobs
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Featured Jobs",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
           SizedBox(height: 10),
           JobCard(
              title: "Senior Product Designer",
              company: "Flipkart",
              location: "Bengaluru",
              type: "Hybrid"),
           JobCard(
              title: "Software Engineer (Backend)",
              company: "Zomato",
              location: "Gurgaon",
              type: "Remote"),
           JobCard(
              title: "Data Scientist",
              company: "Microsoft",
              location: "Hyderabad",
              type: "On-site"),
           SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final String name;
  final int jobs;
  final IconData logo;

   CompanyCard(
      {super.key, required this.name, required this.jobs, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin:  EdgeInsets.only(right: 12),
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, offset:  Offset(0, 3), blurRadius: 5)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(logo, size: 40, color: Colors.indigo),
           SizedBox(height: 10),
          Text(name,
              style:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
           SizedBox(height: 5),
          Text("$jobs open jobs", style:  TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class StepsSection extends StatelessWidget {
   StepsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      ("Create Account", Icons.person_add_alt),
      ("Upload CV/Resume", Icons.upload_file),
      ("Find Suitable Job", Icons.search),
      ("Apply Job", Icons.done_all),
    ];

    return Column(
      children: [
         Text("Only 4 Steps to get your dream job",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
         SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 30,
          runSpacing: 20,
          children: steps
              .map((e) => Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.indigo.shade100,
                        child: Icon(e.$2, color: Colors.indigo),
                      ),
                       SizedBox(height: 6),
                      Text(e.$1, style:  TextStyle(fontSize: 12)),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String type;

   JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding:  EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, offset:  Offset(0, 3), blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                   TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
           SizedBox(height: 4),
          Text(company, style:  TextStyle(color: Colors.grey)),
           SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$location • $type",
                  style:  TextStyle(fontSize: 13, color: Colors.black54)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child:  Text("Apply",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

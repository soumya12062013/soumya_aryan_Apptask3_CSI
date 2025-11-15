import 'package:flutter/material.dart';
import 'package:internshala/Widget/Card.dart';

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(10),
                  elevation: 2,
                  color: const Color.fromARGB(255, 223, 222, 222),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for a job or company",
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  color: const Color.fromARGB(255, 5, 48, 83),
                  width: 350,
                  height: 25,
                  padding: EdgeInsets.all(5),

                  child: Center(
                    child: Text(
                      'Recommendation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Cards(
                  company: 'Google',
                  jobRole: 'Senior Product Designer',
                  salary: '2000-4000',
                  shift: 'onsite',
                  site: 'full Time',
                  image: 'Assets/Images/image.png',
                ),
                SizedBox(height: 30),
                Cards(
                  company: 'Meta',
                  jobRole: 'Software Developer',
                  salary: '2000-4000',
                  shift: 'onsite',
                  site: 'full Time',
                  image: 'Assets/Images/meta.png',
                ),
                SizedBox(height: 30),
                Cards(
                  company: 'Apple',
                  jobRole: 'Senior Product Designer',
                  salary: '2000-4000',
                  shift: 'onsite',
                  site: 'Half time',
                  image: 'Assets/Images/apple.jpeg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

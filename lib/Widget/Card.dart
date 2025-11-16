import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String image;
  final String company;
  final String shift;
  final String salary;
  final String jobRole;
  final String site;

  const Cards({
    // super.key,
    required this.image,
    required this.company,
    required this.jobRole,
    required this.salary,
    required this.shift,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color.fromARGB(255, 201, 219, 234),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 147, 191, 227), width: 2),

        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 237, 242, 245),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                shift,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            jobRole,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            salary,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  site,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Icon(Icons.copy, size: 22, color: Colors.grey.shade700),
            ],
          ),
        ],
      ),
    );
  }
}

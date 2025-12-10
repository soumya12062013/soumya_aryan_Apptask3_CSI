import 'package:flutter/material.dart';
import 'package:internshala/Screens/JobApi/JobApi.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  State<JobPostingScreen> createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final minSalaryController = TextEditingController();
  final maxSalaryController = TextEditingController();
  final salaryCurrencyController = TextEditingController(text: "INR");
  final descriptionController = TextEditingController();
  final responsibilitiesController = TextEditingController();
  final qualificationsController = TextEditingController();
  final experienceController = TextEditingController();

  String? jobType;
  List<String> skills = [];
  final skillController = TextEditingController();

  DateTime? deadline;

  bool isLoading = false;

  Future<void> submitJob() async {
    if (!_formKey.currentState!.validate()) return;

    if (deadline == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select application deadline")),
      );
      return;
    }

    setState(() => isLoading = true);

    final response = await JobApi().postJob(
      title: titleController.text,
      location: locationController.text,
      jobType: jobType!,
      minSalary: int.parse(minSalaryController.text),
      maxSalary: int.parse(maxSalaryController.text),
      salaryCurrency: salaryCurrencyController.text,
      description: descriptionController.text,
      responsibilities: responsibilitiesController.text,
      qualifications: qualificationsController.text,
      experienceRequired: experienceController.text,
      skills: skills,
      applicationDeadline: deadline!.toIso8601String().split("T").first,
    );

    setState(() => isLoading = false);

    if (response["success"]) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Job Posted Successfully!")));

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post a Job"),
        backgroundColor: Colors.blueAccent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTitle("Job Information"),

              buildTextField(titleController, "Job Title"),
              buildTextField(locationController, "Location"),

              buildDropdown(),

              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      minSalaryController,
                      "Min Salary",
                      type: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildTextField(
                      maxSalaryController,
                      "Max Salary",
                      type: TextInputType.number,
                    ),
                  ),
                ],
              ),

              buildTextField(
                salaryCurrencyController,
                "Currency (INR, USD...)",
              ),

              buildTitle("Description"),
              buildTextField(
                descriptionController,
                "Job Description",
                maxLines: 4,
              ),

              buildTitle("Responsibilities"),
              buildTextField(
                responsibilitiesController,
                "Responsibilities",
                maxLines: 3,
              ),

              buildTitle("Qualifications"),
              buildTextField(
                qualificationsController,
                "Qualifications",
                maxLines: 3,
              ),

              buildTextField(experienceController, "Experience Required"),

              buildSkillsInput(),

              buildDeadlinePicker(),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: isLoading ? null : submitJob,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Submit Job", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines,
        validator: (v) => v!.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: "Job Type",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        initialValue: jobType,
        items: const [
          DropdownMenuItem(value: "FULL_TIME", child: Text("Full Time")),
          DropdownMenuItem(value: "PART_TIME", child: Text("Part Time")),
          DropdownMenuItem(value: "INTERNSHIP", child: Text("Internship")),
        ],
        validator: (v) => v == null ? "Select job type" : null,
        onChanged: (val) => setState(() => jobType = val),
      ),
    );
  }

  Widget buildSkillsInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("Skills"),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: skillController,
                decoration: InputDecoration(
                  labelText: "Add Skill",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                if (skillController.text.trim().isEmpty) return;
                setState(() {
                  skills.add(skillController.text.trim());
                  skillController.clear();
                });
              },
              child: const Text("Add"),
            ),
          ],
        ),

        Wrap(
          spacing: 8,
          children: skills.map((skill) {
            return Chip(
              label: Text(skill),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () {
                setState(() => skills.remove(skill));
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildDeadlinePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("Application Deadline"),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2050),
              initialDate: DateTime.now(),
            );

            if (picked != null) {
              setState(() => deadline = picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              deadline == null
                  ? "Select Deadline"
                  : "${deadline!.year}-${deadline!.month}-${deadline!.day}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

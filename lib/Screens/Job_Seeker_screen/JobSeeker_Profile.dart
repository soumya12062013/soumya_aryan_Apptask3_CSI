import 'package:flutter/material.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Submit_Notification_page.dart';
import 'package:internshala/Widget/bottom_nav_seeker.dart';
import 'package:internshala/Screens/Job_Seeker_screen/job_list_page.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Job_Seeker_Chat_page.dart';
import 'package:internshala/Screens/Job_Seeker_screen/HomeScreen.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:img_picker/img_picker.dart';

class SeekerBioScreen extends StatefulWidget {
  const SeekerBioScreen({super.key});

  @override
  State<SeekerBioScreen> createState() => _SeekerBioScreenState();
}

class _SeekerBioScreenState extends State<SeekerBioScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameCtl = TextEditingController();
  final _jobTitleCtl = TextEditingController();
  final _companyNameCtl = TextEditingController();
  final _locationCtl = TextEditingController();
  final _contactEmailCtl = TextEditingController();
  final _bioCtl = TextEditingController();
  final _linkedinCtl = TextEditingController();
  final _specializationsCtl = TextEditingController();
  final _aboutCompanyCtl = TextEditingController();

  bool _agreePrivacy = false;
  bool _visibleProfile = false;

  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _pickedImage = File(file.path);
      });
    }
  }

  @override
  void dispose() {
    _fullNameCtl.dispose();
    _jobTitleCtl.dispose();
    _companyNameCtl.dispose();
    _locationCtl.dispose();
    _contactEmailCtl.dispose();
    _bioCtl.dispose();
    _linkedinCtl.dispose();
    _specializationsCtl.dispose();
    _aboutCompanyCtl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!_agreePrivacy) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please agree to the privacy policy.')),
      );
      return;
    }

    final data = {
      'fullName': _fullNameCtl.text.trim(),
      'jobTitle': _jobTitleCtl.text.trim(),
      'companyName': _companyNameCtl.text.trim(),
      'location': _locationCtl.text.trim(),
      'contactEmail': _contactEmailCtl.text.trim(),
      'bio': _bioCtl.text.trim(),
      'linkedin': _linkedinCtl.text.trim(),
      'specializations': _specializationsCtl.text.trim(),
      'aboutCompany': _aboutCompanyCtl.text.trim(),
      'visibleProfile': _visibleProfile,
      'photo': _pickedImage?.path,
      'submittedAt': DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
    };

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Application submitted')));
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hint,
    int maxLines = 1,
    bool requiredField = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (v) {
        if (requiredField && (v == null || v.trim().isEmpty)) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label + (requiredField ? ' *' : ''),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF10213A),
        title: Text('Profile'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          style: IconButton.styleFrom(foregroundColor: Colors.white),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => RoleSelectionPage()),
            // );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            style: IconButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              // Navigator.push(
              //   context,
              // MaterialPageRoute(builder: (context) => RoleSelectionPage()),
              // );
            },
          ),
        ],
        elevation: 0,
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // upload box (top)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    _pickImage();
                  },
                  child: Container(
                    height: 120,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: _pickedImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload,
                                size: 36,
                                color: Colors.green[700],
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Browse photo or drop here',
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'A photo larger than 256px wide works best.',
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _pickedImage!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(child: Text('Selected photo')),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    _pickedImage = null;
                                  });
                                },
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Full Name',
                      controller: _fullNameCtl,
                      requiredField: true,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Job Title',
                      controller: _jobTitleCtl,
                      requiredField: true,
                    ),
                  ),

                  //  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Company Name',
                      controller: _companyNameCtl,
                      requiredField: true,
                    ),
                  ),

                  // SizedBox(width: 20),
                ],
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Contact Email',
                      controller: _contactEmailCtl,
                      keyboardType: TextInputType.emailAddress,
                      requiredField: true,
                    ),
                  ),
                ],
              ),

              Text(
                'Company Name + Logo *',
                //  style: Theme.of(context).textTheme,
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  _pickedImage == null ? _pickImage() : null;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pick company logo (not wired)')),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300, width: 1.4),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Expanded(child: Text('company-logo.png')),
                      IconButton(
                        icon: Icon(Icons.upload_file),
                        onPressed: () {
                          // same pick action
                          _pickedImage;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 18),

              _buildTextField(
                label: 'Bio Description',
                controller: _bioCtl,
                maxLines: 3,
              ),

              SizedBox(height: 12),

              _buildTextField(
                label: 'LinkedIn Profile URL',
                controller: _linkedinCtl,
                hint: 'linkedin.com/in/yourprofile',
              ),

              SizedBox(height: 12),

              _buildTextField(
                label: 'Specializations',
                controller: _specializationsCtl,
                maxLines: 4,
                hint: 'Write here...',
              ),

              SizedBox(height: 12),

              _buildTextField(
                label: 'About Your Company',
                controller: _aboutCompanyCtl,
                maxLines: 4,
                hint: 'Write here...',
              ),

              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _agreePrivacy,
                    onChanged: (v) =>
                        setState(() => _agreePrivacy = v ?? false),
                  ),
                  Expanded(
                    child: Text(
                      'By submitting this application, I agree that I have read the Privacy Policy and confirm that NextStep may use my personal details to process my job application.',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _visibleProfile,
                    onChanged: (v) =>
                        setState(() => _visibleProfile = v ?? false),
                  ),
                  Expanded(
                    child: Text(
                      'Make my profile visible to candidates and other recruiters.',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    _submit();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplicationSubmittedScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF10213A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'SUBMIT APPLICATION',
                    style: TextStyle(
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: JobSeekerBottomNavigation(
          currentIndex: 3,
          onTabSelected: (index) {
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
            } else if (index == 3) {}
          },
        ),
      ),
    );
  }
}

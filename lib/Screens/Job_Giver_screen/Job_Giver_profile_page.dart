import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
 import 'package:image_picker/image_picker.dart';
import 'package:next_steps/Screens/Auth_Screen/Login_screen.dart';
import 'package:next_steps/Screens/Job_Seeker_screen/Submit_Notification_page.dart';
import 'package:next_steps/Screens/role_selection_page.dart';

class RecruiterBioScreen extends StatefulWidget {
   RecruiterBioScreen({super.key});

  @override
  State<RecruiterBioScreen> createState() => _RecruiterBioScreenState();
}

class _RecruiterBioScreenState extends State<RecruiterBioScreen> {
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

    //debugPrint('Submitting recruiter bio: $data');

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Application submitted')),
    );
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
        if (keyboardType == TextInputType.emailAddress &&
            v != null &&
            v.isNotEmpty) {
         // final emailRegex =
            //  RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
         // if (!emailRegex.hasMatch(v.trim())) return 'Enter a valid email';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label + (requiredField ? ' *' : ''),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        contentPadding:
             EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      ),
    );
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF10213A),
        title:  Text('Recruiter Bio'),
        centerTitle: false,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.account_circle_outlined),
            onPressed: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoleSelectionPage(),
                ),
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // upload box (top)
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // open image picker or camera
                     _pickImage();
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        content: Text('Tap to pick an image (not wired)')));
                  },
                  child: Container(
                    height: 120,
                    padding:  EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: _pickedImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload,
                                  size: 36, color: Colors.green[700]),
                               SizedBox(height: 6),
                              Text('Browse photo or drop here',
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w600)),
                               SizedBox(height: 4),
                               Text('A photo larger than 256px wide works best.'),
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
                                icon:  Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    _pickedImage = null;
                                  });
                                },
                              )
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
                   SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      label: 'Job Title',
                      controller: _jobTitleCtl,
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
                      label: 'Company Name',
                      controller: _companyNameCtl,
                      requiredField: true,
                    ),
                  ),
                   SizedBox(width: 12),
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

               SizedBox(height: 12),

              
              Text(
                'Company Name + Logo *',
              //  style: Theme.of(context).textTheme,
              ),
               SizedBox(height: 8),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text('Pick company logo (not wired)')));
                },
                child: Container(
                  padding:
                       EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.4),
                  ),
                  child: Row(
                    children: [
                       Icon(Icons.insert_drive_file_outlined,
                          color: Colors.grey),
                       SizedBox(width: 10),
                       Expanded(child: Text('company-logo.png')),
                      IconButton(
                        icon:  Icon(Icons.upload_file),
                        onPressed: () {
                          // same pick action
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

              // LinkedIn
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

              // About Your Company
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
                      onChanged: (v) => setState(() => _agreePrivacy = v ?? false)),
                   Expanded(
                    child: Text(
                        'By submitting this application, I agree that I have read the Privacy Policy and confirm that NextStep may use my personal details to process my job application.'),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: _visibleProfile,
                      onChanged: (v) => setState(() => _visibleProfile = v ?? false)),
                   Expanded(child: Text('Make my profile visible to candidates and other recruiters.')),
                ],
              ),

               SizedBox(height: 16),

              
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: (){
                    _submit();
                     Navigator.push(
                              context,
                        MaterialPageRoute(
                       builder: (context) => ApplicationSubmittedScreen(),
                        )
                     );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF10213A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                  ),
                  child:  Text(
                    'SUBMIT APPLICATION',
                    style: TextStyle(letterSpacing: 0.6, fontWeight: FontWeight.w600,color: Colors.white),
                  ),
                ),
              ),

             

               SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

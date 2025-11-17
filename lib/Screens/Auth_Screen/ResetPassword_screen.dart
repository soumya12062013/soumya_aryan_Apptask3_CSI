import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
   ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isObscured1 = true;
  bool _isObscured2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'Assets/Images/logo.jpg', 
                      height: 80,
                    ),
                     SizedBox(height: 12),
                     Text(
                      'Your work people are here',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C2B4A),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 40),

              Container(
                padding:  EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:  Color(0xFFF8FBFF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset:  Offset(0, 2),
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                        child: Text(
                          'Create a new password',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                       SizedBox(height: 24),

                       Text(
                        'New Password',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscured1,
                        decoration: InputDecoration(
                          hintText: 'Enter your new password',
                          prefixIcon:
                               Icon(Icons.lock_outline, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured1 = !_isObscured1;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                 BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                      ),
                       SizedBox(height: 20),

                      // Confirm Password
                       Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: _confirmController,
                        obscureText: _isObscured2,
                        decoration: InputDecoration(
                          hintText: 'Confirm your new password',
                          prefixIcon:
                               Icon(Icons.lock_outline, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured2 = !_isObscured2;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                 BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                      ),
                       SizedBox(height: 24),

                      // Password requirements
                       Text(
                        'Your password must contain:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                       SizedBox(height: 8),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _PasswordRequirement(text: 'At least 8 characters'),
                          _PasswordRequirement(text: 'One uppercase letter'),
                          _PasswordRequirement(text: 'One lowercase letter'),
                          _PasswordRequirement(text: 'One number'),
                          _PasswordRequirement(
                              text: 'One special character (!@#\$%^&*)'),
                        ],
                      ),
                       SizedBox(height: 28),

                      // Reset Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Color(0xFF1C2B4A),
                            padding:  EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle reset logic
                            }
                          },
                          child:  Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordRequirement extends StatelessWidget {
  final String text;
   _PasswordRequirement({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.check, color: Colors.blue, size: 16),
         SizedBox(width: 8),
        Text(
          text,
          style:  TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

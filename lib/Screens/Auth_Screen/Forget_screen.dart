import 'package:flutter/material.dart';
import 'package:next_steps/Screens/Auth_Screen/Login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
   ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
                     SizedBox(height: 16),
                     Text(
                      'Your work people are here',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A2B48),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 60),

              Container(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color:  Color(0xFFF7F9FC),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset:  Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Center(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                     SizedBox(height: 24),
                     Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(height: 8),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon:  Icon(Icons.email_outlined),
                        hintText: "Enter your email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                     SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text('OTP sent to your email'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Color(0xFF0D2149),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                        ),
                        child:  Text(
                          'Send OTP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                         // Navigator.pop(context);
                         Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>LoginScreen(),
                ),
              );
                        },
                        child:  Text(
                          "Back to Login",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 40),
               Text(
                "Enter your email to reset your password",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

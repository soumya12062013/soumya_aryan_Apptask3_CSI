import 'package:flutter/material.dart';
import 'package:internshala/Widget/Buttons.dart';
import 'package:internshala/Screens/Main_Screens/HomeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _usernameC = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;

  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'Assets/Images/logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "Create an Account",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          'Sign up now to get started with an account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        height: 55,
                        child: OutlinedButton.icon(
                          icon: Image.asset(
                            'Assets/Images/image.png',
                            height: 24,
                            width: 24,
                          ),
                          label: const Text(
                            'Sign Up with Google',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(thickness: 1, color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(thickness: 1, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          controller: _emailC,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            hintText: 'Enter your Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          controller: _usernameC,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'csitranees@gmail.com',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          controller: _passwordC,
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordC.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Button(
                        color: Colors.blue,
                        height: 50,
                        width: 360,
                        text: 'Login',
                        path: HomeScreen(),
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

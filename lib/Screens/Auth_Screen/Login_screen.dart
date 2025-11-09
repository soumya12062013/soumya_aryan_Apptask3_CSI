import 'package:flutter/material.dart';
import 'Signin_screen.dart';
import 'package:internshala/Widget/Buttons.dart';
import 'package:internshala/Screens/Main_Screens/HomeScreen.dart';
import 'package:internshala/Screens/Auth_Service/Auth_Service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  bool _isloading = false;
  bool _obscurePassword = true;
  Future<void> _Login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      final response = await _authService.login(
        email: _emailC.text.trim(),
        password: _passwordC.text.trim(),
      );
      setState(() {
        _isloading = false;
      });
      if (response['success']) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        final snackBar = SnackBar(content: Text(response['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

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
                          "Sign in to your Account",
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
                          'Welcome back, Please enter your details',
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
                            'Continue with Google',
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
                      SizedBox(height: 30),
                      _isloading
                          ? CircularProgressIndicator()
                          : Button(
                              color: Colors.blue,
                              text: 'Login',
                              height: 50,
                              width: 360,
                              path: _Login,
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

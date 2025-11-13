import 'package:flutter/material.dart';
import '../Auth_Screen/Signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 300),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                child: Image.asset('Assets/Images/logo.jpg', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

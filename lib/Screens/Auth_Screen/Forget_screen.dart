import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 7, 27, 61),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    ' To reset your password, you need your email ormobile number that can be authenticated',
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 115, 117, 119),
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

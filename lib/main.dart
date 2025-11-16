import 'package:flutter/material.dart';
import 'package:internshala/Screens/Auth_Screen/Signin_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala/Screens/Auth_Screen/Login_screen.dart';
import 'package:internshala/Screens/Intro_screen/Splash_screen.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Job_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Job(),
    ),
  );
}

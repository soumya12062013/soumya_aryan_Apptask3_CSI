import 'package:flutter/material.dart';
import 'package:internshala/Screens/Auth_Screen/Signin_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala/Screens/Auth_Screen/Login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SignInScreen(),
    ),
  );
}

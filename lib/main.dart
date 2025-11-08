import 'package:flutter/material.dart';
//import 'package:internshala/Screens/Auth_Screen/Signin_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_steps/Screens/Auth_Screen/Login_screen.dart';
import 'package:next_steps/Screens/Auth_Screen/Signin_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SignInScreen(),
      routes: {
        '/signup': (context) =>  SignInScreen(),
        '/login': (context) =>  LoginScreen(),
      },
    ),
  );
}

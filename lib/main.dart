// import 'package:flutter/material.dart';
// //import 'package:internshala/Screens/Auth_Screen/Signin_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:next_steps/Screens/Auth_Screen/Login_screen.dart';
// import 'package:next_steps/Screens/Auth_Screen/Signin_screen.dart';
// import 'package:next_steps/Screens/network_screen.dart';
// import 'package:next_steps/Screens/profile_screen.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         ),
//       home: MyNetworkScreen(),
//       routes: {
//         '/signup': (context) =>  SignInScreen(),
//         '/login': (context) =>  LoginScreen(),
//          '/profile': (context) =>  ProfileScreen(), 
//       },
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:next_steps/Screens/network_screen.dart';
import 'package:next_steps/pages/role_selection_page.dart';
//import 'my_network_screen.dart'; // make sure the import path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'network page',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home:  NextStepHomeScreen(),
    );
  }
}

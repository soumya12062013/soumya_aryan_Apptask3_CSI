import 'package:flutter/material.dart';

class PasswordUpdatedScreen extends StatelessWidget {
   PasswordUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Column(
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
               SizedBox(height: 60),

              
              Container(
                padding:  EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color:  Color(0xFFF8FBFF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset:  Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 4,
                        ),
                      ),
                      child:  Icon(
                        Icons.check_rounded,
                        color: Colors.green,
                        size: 50,
                      ),
                    ),
                     SizedBox(height: 24),

                    // Title
                     Text(
                      'Updated',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                     SizedBox(height: 12),

                    // Description
                     Text(
                      'Congratulations! Your password is updated successfully. Click continue to login.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                     SizedBox(height: 30),

                    // Confirm Button
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
                          // Navigate to login screen
                        },
                        child:  Text(
                          'Confirm',
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
            ],
          ),
        ),
      ),
    );
  }
}

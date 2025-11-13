import 'package:flutter/material.dart';
import 'package:internshala/Screens/Auth_Screen/Auth_Service.dart';
import 'package:internshala/Widget/Buttons.dart';
//import 'package:internshala/Screens/Auth_Screen/Login_Screen.dart';
import 'package:internshala/Screens/Auth_Screen/Role_Assign.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpC = TextEditingController();
  bool _isLoading = false;
  bool _isResending = false;

  Future<void> _verifyOtp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      print(' OTP VERIFICATION STARTED');
      print(' Email: ${widget.email}');
      print(' OTP: ${otpC.text.trim()}');

      final response = await _authService.otpVerification(
        otp: otpC.text.trim(),
        email: widget.email,
      );

      setState(() {
        _isLoading = false;
      });

      print(' Response: $response');

      if (response['success']) {
        print(' OTP Verified Successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP Verified Successfully! '),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RoleSelectionPage()),
          (route) => false,
        );
      } else {
        print(' OTP Verification Failed: ${response['message']}');
        final snackBar = SnackBar(
          content: Text(response['message'] ?? 'Verification failed'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future<void> _resendOtp() async {
    setState(() {
      _isResending = true;
    });

    print(' RESEND OTP STARTED');
    print(' Email: ${widget.email}');

    final response = await _authService.ResendOtp(email: widget.email);

    setState(() {
      _isResending = false;
    });

    print(' Resend Response: $response');

    if (response['success']) {
      print(' OTP Resent Successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP has been resent to your email!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      print(' Resend Failed: ${response['message']}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message'] ?? 'Failed to resend OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),

                    Icon(
                      Icons.shield_moon_outlined,
                      size: 100,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter the OTP sent to',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 360,
                      child: TextFormField(
                        controller: otpC,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 10,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter OTP';
                          }
                          if (value.length < 6) {
                            return 'OTP must be 6 digits';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          labelText: 'OTP',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _isLoading
                        ? CircularProgressIndicator()
                        : Button(
                            color: Colors.blue,
                            text: 'Verify OTP',
                            width: 360,
                            height: 50,
                            path: _verifyOtp,
                          ),
                    SizedBox(height: 20),
                    _isResending
                        ? CircularProgressIndicator()
                        : TextButton(
                            onPressed: _resendOtp,
                            child: Text(
                              "Didn't receive code? Resend OTP",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

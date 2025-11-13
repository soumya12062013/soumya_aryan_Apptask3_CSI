import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl = "https://job-portal-my15.onrender.com/api/auth";

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      print(' LOGIN API CALLED');
      print(' URL: $baseUrl/login');
      print(
        ' Request Body: ${jsonEncode({'email': email, 'password': password})}',
      );

      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print(' Response Status: ${response.statusCode}');
      print(' Raw Response Body: "${response.body}"');

      final body = response.body.trim();
      if (body.isEmpty) {
        print(' Empty response body received');
        return {'success': false, 'message': 'Empty response from server'};
      }

      final data = json.decode(body);
      print(' Decoded Response: $data');

      if (response.statusCode == 200) {
        if (data['accessToken'] == null) {
          print(' Missing accessToken in response');
          return {
            'success': false,
            'message': 'Access token missing in response',
          };
        }

        final pref = await SharedPreferences.getInstance();
        await pref.setString('accessToken', data['accessToken']);
        if (data['refreshToken'] != null) {
          await pref.setString('refreshToken', data['refreshToken']);
        }

        print(' Tokens saved locally');
        return {'success': true, 'data': data};
      } else {
        print(' Login failed: ${data['message']}');
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed (${response.statusCode})',
        };
      }
    } catch (e) {
      print(' Exception during login: $e');
      return {'success': false, 'message': 'Login failed: $e'};
    }
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      print(' REGISTER API CALLED');
      print(' URL: $baseUrl/register');
      print(
        ' Request Body: ${jsonEncode({'name': name, 'email': email, 'password': password})}',
      );

      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      print(' Response Status: ${response.statusCode}');
      print(' Raw Response Body: "${response.body}"');

      final body = response.body.trim();
      if (body.isEmpty) {
        print(' Empty response body received');
        return {'success': false, 'message': 'Empty response from server'};
      }

      Map<String, dynamic> data;
      try {
        data = json.decode(body);
        print(' Decoded JSON Response: $data');
      } catch (e) {
        print(' Not JSON, treating as plain text response');

        data = {'message': body};
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': data};
      } else {
        String errorMessage =
            data['message'] ??
            data['error'] ??
            'Registration failed (${response.statusCode})';
        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      print(' Exception during registration: $e');
      return {'success': false, 'message': 'Registration failed: $e'};
    }
  }

  Future<Map<String, dynamic>> otpVerification({
    required String email,
    required String otp,
  }) async {
    try {
      print(' OTP VERIFICATION API CALLED');
      print(' URL: $baseUrl/verify-otp');
      print(' Request Body: ${jsonEncode({'email': email, 'otp': otp})}');

      final response = await http.post(
        Uri.parse("$baseUrl/verify-otp"),
        body: jsonEncode({'email': email, 'otp': otp}),
        headers: {'Content-Type': 'application/json'},
      );

      print(' Response Status: ${response.statusCode}');
      print(' Raw Response Body: "${response.body}"');

      final body = response.body.trim();
      if (body.isEmpty) {
        print(' Empty response body received');
        return {'success': false, 'message': 'Empty response from server'};
      }

      Map<String, dynamic> data;
      try {
        data = jsonDecode(body);
        print(' Decoded JSON Response: $data');
      } catch (e) {
        print(' Not JSON, treating as plain text response');

        data = {'message': body};
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(' OTP Verification successful');
        return {'success': true, 'data': data};
      } else {
        print(' OTP Verification failed');
        String errorMessage =
            data['message'] ??
            data['error'] ??
            'Verification failed (${response.statusCode})';
        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      print(' Exception during OTP verification: $e');
      return {'success': false, 'message': 'An unexpected error occurred: $e'};
    }
  }

  Future<Map<String, dynamic>> roleAssign({
    required String email,
    required String role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/assign-role'),
        body: jsonEncode({'email': email, 'role': role}),
        headers: {'Content-Type': 'application/json'},
      );
      final body = response.body.trim();
      if (body.isEmpty) {
        print(' Empty response body received');
        return {'success': false, 'message': 'Empty response from server'};
      }

      Map<String, dynamic> data;
      try {
        data = jsonDecode(body);
        print(' Decoded JSON Response: $data');
      } catch (e) {
        print(' Not JSON, treating as plain text response');

        data = {'message': body};
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(' Role Assinged');
        return {'success': true, 'data': data};
      } else {
        print('role assinged');
        String errorMessage =
            data['message'] ??
            data['error'] ??
            'Verification failed (${response.statusCode})';
        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      return {'success': false, 'message': 'An unexpected error occurred: $e'};
    }
  }

  Future<Map<String, dynamic>> ResendOtp({required String email}) async {
    try {
      print(' RESEND OTP API CALLED');
      print(' Trying URL: $baseUrl/resend-otp');
      print(' Request Body: ${jsonEncode({'email': email})}');

      var response = await http.post(
        Uri.parse('$baseUrl/resend-otp'),
        body: jsonEncode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      print(' Response Status: ${response.statusCode}');
      print(' Raw Response Body: "${response.body}"');

      if (response.statusCode == 404) {
        print(' /resend-otp not found, trying /send-otp');
        response = await http.post(
          Uri.parse('$baseUrl/send-otp'),
          body: jsonEncode({'email': email}),
          headers: {'Content-Type': 'application/json'},
        );
        print(' Alternative Response Status: ${response.statusCode}');
        print(' Alternative Response Body: "${response.body}"');
      }

      final body = response.body.trim();
      if (body.isEmpty) {
        print(' Empty response body received');
        return {'success': false, 'message': 'Empty response from server'};
      }

      Map<String, dynamic> data;
      try {
        data = jsonDecode(body);
        print(' Decoded JSON Response: $data');
      } catch (e) {
        print(' Not JSON, treating as plain text response');

        data = {'message': body};
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(' OTP Resent Successfully');
        return {'success': true, 'data': data};
      } else {
        print(' Resend OTP failed with status ${response.statusCode}');
        String errorMessage =
            data['message'] ??
            data['error'] ??
            'Failed to resend OTP (${response.statusCode})';
        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      print(' Exception during resend OTP: $e');
      return {'success': false, 'message': 'An unexpected error occurred: $e'};
    }
  }
}

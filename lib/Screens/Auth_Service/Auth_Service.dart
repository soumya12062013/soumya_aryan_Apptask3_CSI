import 'package:flutter/material.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:http/http.dart';

class AuthService {
  static const String baseUrl =
      "https://job-portal-my15.onrender.com/api/auth/";
      Future<Map<String,dynamic>> login({
        required String email,
        required String password,
      })async{
        try{
          final response = await.http
        }
      }
}

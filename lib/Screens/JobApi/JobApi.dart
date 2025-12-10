import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobApi {
  static const String baseUrl = "https://job-portal-my15.onrender.com/api";

  Future<Map<String, dynamic>> postJob({
    required String title,
    required String location,
    required String jobType,
    required int minSalary,
    required int maxSalary,
    required String salaryCurrency,
    required String description,
    required String responsibilities,
    required String qualifications,
    required String experienceRequired,
    required List<String> skills,
    required String applicationDeadline,
  }) async {
    try {
      print(" JOB CREATE API CALLED");
      print(" URL: $baseUrl/jobs");

      final Map<String, dynamic> bodyData = {
        "title": title,
        "location": location,
        "jobType": jobType,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "salaryCurrency": salaryCurrency,
        "description": description,
        "responsibilities": responsibilities,
        "qualifications": qualifications,
        "experienceRequired": experienceRequired,
        "skills": skills,
        "applicationDeadline": applicationDeadline,
      };

      print(" REQUEST BODY: ${jsonEncode(bodyData)}");

      final pref = await SharedPreferences.getInstance();
      final token = pref.getString('accessToken') ?? "";

      final response = await http.post(
        Uri.parse("$baseUrl/jobs/create"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(bodyData),
      );

      print(" STATUS: ${response.statusCode}");
      print(" RESPONSE: ${response.body}");

      if (response.body.isEmpty) {
        return {"success": false, "message": "Empty response from server"};
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return {"success": true, "data": data};
      } else {
        return {
          "success": false,
          "message": data['message'] ?? "Job posting failed",
        };
      }
    } catch (e) {
      print(" ERROR: $e");
      return {"success": false, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getAllJobs() async {
    try {
      print("➡️ GET ALL JOBS API CALLED");
      print("➡️ URL: $baseUrl/jobs");

      final response = await http.get(
        Uri.parse("$baseUrl/jobs"),
        headers: {"Content-Type": "application/json"},
      );

      print(" STATUS: ${response.statusCode}");
      print(" RAW RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return {
          "success": true,
          "jobs": data, 
        };
      } else {
        return {"success": false, "message": "Failed to load jobs"};
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getJobById(int id) async {
    try {
      print("➡️ GET JOB DETAILS API CALLED");
      print("➡️ URL: $baseUrl/jobs/$id");

      final response = await http.get(
        Uri.parse("$baseUrl/jobs/$id"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.body.isEmpty) {
        return {"success": false, "message": "Empty response from server"};
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {"success": true, "data": data};
      } else {
        return {
          "success": false,
          "message": data["message"] ?? "Failed to fetch job details",
        };
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}

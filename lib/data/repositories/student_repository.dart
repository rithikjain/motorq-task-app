import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:vitclasses/data/models/api_response.dart';
import 'package:vitclasses/services/api_routes.dart';
import 'package:vitclasses/services/utils/shared_prefs.dart';

class StudentRepository {
  Future<ApiResponse<bool>> login(String regNo, name) async {
    log("entered login route");
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + StudentGroup),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "roll_no": regNo,
          "name": name,
        }),
      );

      switch (response.statusCode) {
        case 201:
          SharedPrefs.saveStudentID(regNo);
          SharedPrefs.saveStudentName(name);
          SharedPrefs.saveLoggedInStatus(true);
          return ApiResponse.completed(true);
        default:
          return ApiResponse.error("Something went wrong.");
      }
    } on SocketException {
      return ApiResponse.error("Please connect to the internet.");
    } catch (e) {
      log(e.toString());
      return ApiResponse.error("error: ${e.toString()}");
    }
  }
}
